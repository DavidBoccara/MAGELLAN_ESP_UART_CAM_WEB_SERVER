#include <esp_wifi.h>
#include <esp_event_loop.h>
#include <esp_log.h>
#include <esp_system.h>
#include <nvs_flash.h>
#include <sys/param.h>
#include "esp_sleep.h"
#include <esp_http_server.h>
#include "esp_camera.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "sdkconfig.h"
#include "esp_wifi.h"
#include "esp_system.h"
#include "esp_event.h"
#include "esp_event_loop.h"
#include "nvs_flash.h"
#include "driver/gpio.h"
#include "freertos/portmacro.h"
#include "freertos/event_groups.h"
#include "esp_log.h"
#include "tcpip_adapter.h"
#include "driver/uart.h"
#include "freertos/queue.h"
#include "lwip/sys.h"
#include "lwip/netdb.h"
#include "lwip/api.h"
#include "lwip/err.h"
#include "string.h"
#define SSID "IONISBOT"
#define PASSPHARSE "boboboc98"
//#define SSID "BOCCARA"
//#define PASSPHARSE "strongriver451"
//#define SSID "Livebox-BF50"
//#define PASSPHARSE "YjynsdzcmeA3icpA9Z"

//#define SSID "Wifidrone"
//#define PASSPHARSE "boboboc68"
#define PART_BOUNDARY "123456789000000000000987654321"
static const char* _STREAM_CONTENT_TYPE = "multipart/x-mixed-replace;boundary=" PART_BOUNDARY;
static const char* _STREAM_BOUNDARY = "\r\n--" PART_BOUNDARY "\r\n";
static const char* _STREAM_PART = "Content-Type: image/jpeg\r\nContent-Length: %u\r\n\r\n";

static const char *TAG = "example:http_jpg";
const int CONNECTED_BIT = BIT0;
static EventGroupHandle_t wifi_event_group;
#define TCPServerIP "192.168.2.10"
#define ECHO_TEST_RTS (UART_PIN_NO_CHANGE)
#define ECHO_TEST_CTS (UART_PIN_NO_CHANGE)
#define ECHO_UART_PORT_NUM      (0)
#define ECHO_TEST_TXD   (1)
#define ECHO_TEST_RXD   (3)
#define ECHO_TASK_STACK_SIZE (2048)
#define BUF_SIZE (1024)





static camera_config_t camera_config = {
    .pin_pwdn = 32,
    .pin_reset = -1,
    .pin_xclk = 0,
    .pin_sscb_sda = 26,
    .pin_sscb_scl = 27,

    .pin_d7 = 35,
    .pin_d6 = 34,
    .pin_d5 = 39,
    .pin_d4 = 36,
    .pin_d3 = 21,
    .pin_d2 = 19,
    .pin_d1 = 18,
    .pin_d0 = 5,
    .pin_vsync = 25,
    .pin_href = 23,
    .pin_pclk = 22,

    //XCLK 20MHz or 10MHz
    .xclk_freq_hz = 20000000,
    .ledc_timer = LEDC_TIMER_0,
    .ledc_channel = LEDC_CHANNEL_0,

    .pixel_format = PIXFORMAT_JPEG, //YUV422,GRAYSCALE,RGB565,JPEG
    .frame_size = FRAMESIZE_SVGA,   //QQVGA-UXGA Do not use sizes above QVGA when not JPEG

    .jpeg_quality = 12, //0-63 lower number means higher quality
    .fb_count = 1       //if more than one, i2s runs in continuous mode. Use only with JPEG
};




static esp_err_t init_camera()
{
  //initialize the camera
  esp_err_t err = esp_camera_init(&camera_config);
  if (err != ESP_OK)
  {
    ESP_LOGE(TAG, "Camera Init Failed");
    return err;
  }

  return ESP_OK;
}

typedef struct
{
  httpd_req_t *req;
  size_t len;
} jpg_chunking_t;


static size_t jpg_encode_stream(void *arg, size_t index, const void *data, size_t len)
{
  jpg_chunking_t *j = (jpg_chunking_t *)arg;
  if (!index)
  {
    j->len = 0;
  }
  if (httpd_resp_send_chunk(j->req, (const char *)data, len) != ESP_OK)
  {
    return 0;
  }
  j->len += len;
  return len;
}
/*
static esp_err_t jpg_httpd_handler(httpd_req_t *req)
{
  camera_fb_t *fb = NULL;
  esp_err_t res = ESP_OK;
  size_t fb_len = 0;
  int64_t fr_start = esp_timer_get_time();

  fb = esp_camera_fb_get();
  if (!fb)
  {
    ESP_LOGE(TAG, "Camera capture failed");
    httpd_resp_send_500(req);
    return ESP_FAIL;
  }
  res = httpd_resp_set_type(req, "image/jpeg");
  if (res == ESP_OK)
  {
    res = httpd_resp_set_hdr(req, "Content-Disposition", "inline; filename=capture.jpg");
  }

  if (res == ESP_OK)
  {
    fb_len = fb->len;
    res = httpd_resp_send(req, (const char *)fb->buf, fb->len);
  }
  esp_camera_fb_return(fb);
  int64_t fr_end = esp_timer_get_time();
  ESP_LOGI(TAG, "JPG: %uKB %ums", (uint32_t)(fb_len / 1024), (uint32_t)((fr_end - fr_start) / 1000));
  return res;
}
*/

static esp_err_t jpg_httpd_handler(httpd_req_t *req){
    camera_fb_t * fb = NULL;
    esp_err_t res = ESP_OK;
    size_t _jpg_buf_len;
    uint8_t * _jpg_buf;
    char * part_buf[64];
    static int64_t last_frame = 0;
    if(!last_frame) {
        last_frame = esp_timer_get_time();
    }

    res = httpd_resp_set_type(req, _STREAM_CONTENT_TYPE);
    if(res != ESP_OK){
        return res;
    }

    while(true){
        fb = esp_camera_fb_get();
        if (!fb) {
            ESP_LOGE(TAG, "Camera capture failed");
            res = ESP_FAIL;
            break;
        }
        if(fb->format != PIXFORMAT_JPEG){
            bool jpeg_converted = frame2jpg(fb, 80, &_jpg_buf, &_jpg_buf_len);
            if(!jpeg_converted){
                ESP_LOGE(TAG, "JPEG compression failed");
                esp_camera_fb_return(fb);
                res = ESP_FAIL;
            }
        } else {
            _jpg_buf_len = fb->len;
            _jpg_buf = fb->buf;
        }

        if(res == ESP_OK){
            res = httpd_resp_send_chunk(req, _STREAM_BOUNDARY, strlen(_STREAM_BOUNDARY));
        }
        if(res == ESP_OK){
            size_t hlen = snprintf((char *)part_buf, 64, _STREAM_PART, _jpg_buf_len);

            res = httpd_resp_send_chunk(req, (const char *)part_buf, hlen);
        }
        if(res == ESP_OK){
            res = httpd_resp_send_chunk(req, (const char *)_jpg_buf, _jpg_buf_len);
        }
        if(fb->format != PIXFORMAT_JPEG){
            free(_jpg_buf);
        }
        esp_camera_fb_return(fb);
        if(res != ESP_OK){
            break;
        }
        int64_t fr_end = esp_timer_get_time();
        int64_t frame_time = fr_end - last_frame;
        last_frame = fr_end;
        frame_time /= 1000;
        ESP_LOGI(TAG, "MJPG: %uKB %ums (%.1ffps)",
            (uint32_t)(_jpg_buf_len/1024),
            (uint32_t)frame_time, 1000.0 / (uint32_t)frame_time);
    }

    last_frame = 0;
    return res;
}
httpd_uri_t uri_handler_jpg = {
    .uri = "/jpg",
    .method = HTTP_GET,
    .handler = jpg_httpd_handler};

httpd_handle_t start_webserver(void)
{
  httpd_handle_t server = NULL;
  httpd_config_t config = HTTPD_DEFAULT_CONFIG();

  // Start the httpd server
  ESP_LOGI(TAG, "Starting server on port: '%d'", config.server_port);
  if (httpd_start(&server, &config) == ESP_OK)
  {
    // Set URI handlers
    ESP_LOGI(TAG, "Registering URI handlers");
    httpd_register_uri_handler(server, &uri_handler_jpg);
    return server;
  }

  ESP_LOGI(TAG, "Error starting server!");
  return NULL;
}

void stop_webserver(httpd_handle_t server)
{
  // Stop the httpd server
  httpd_stop(server);
}

static esp_err_t event_handler(void *ctx, system_event_t *event)
{
  httpd_handle_t *server = (httpd_handle_t *)ctx;

  switch (event->event_id)
  {
  case SYSTEM_EVENT_STA_START:
    ESP_LOGI(TAG, "SYSTEM_EVENT_STA_START");
    ESP_ERROR_CHECK(esp_wifi_connect());
    break;
  case SYSTEM_EVENT_STA_GOT_IP:
    xEventGroupSetBits(wifi_event_group, CONNECTED_BIT);
    ESP_LOGI(TAG, "SYSTEM_EVENT_STA_GOT_IP");
    ESP_LOGI(TAG, "Got IP: '%s'",
             ip4addr_ntoa(&event->event_info.got_ip.ip_info.ip));


    /* Start the web server */
    if (*server == NULL)
    {
      *server = start_webserver();
    }
    break;
  case SYSTEM_EVENT_STA_DISCONNECTED:

    ESP_LOGI(TAG, "SYSTEM_EVENT_STA_DISCONNECTED");
    ESP_ERROR_CHECK(esp_wifi_connect());
    xEventGroupClearBits(wifi_event_group, CONNECTED_BIT);

    /* Stop the web server */
    if (*server)
    {
      stop_webserver(*server);
      *server = NULL;
    }
    break;
  default:
    break;
  }
  return ESP_OK;
}





int cnt = 0; 
        int s, r;
struct sockaddr_in tcpServerAddr;
void tcp_client(char MESSAGE[50]){
    
    if (cnt == 0)
    {
        cnt=1;
        
        tcpServerAddr.sin_addr.s_addr = inet_addr(TCPServerIP);
        tcpServerAddr.sin_family = AF_INET;
        tcpServerAddr.sin_port = htons( 5000 );
        char recv_buf[64];
        
      
    }
  xEventGroupWaitBits(wifi_event_group,CONNECTED_BIT,false,true,portMAX_DELAY);
        s = socket(AF_INET, SOCK_STREAM, 0);

    ESP_LOGI(TAG,"tcp_client task started \n");
  
    if(s < 0) {
        ESP_LOGE(TAG, "... Failed to allocate socket.\n");
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
    ESP_LOGI(TAG, "... allocated socket\n");
     if(connect(s, (struct sockaddr *)&tcpServerAddr, sizeof(tcpServerAddr)) != 0) {
        ESP_LOGE(TAG, "... socket connect failed errno=%d \n", errno);
        close(s);
        vTaskDelay(4000 / portTICK_PERIOD_MS);
    }
    ESP_LOGI(TAG, "... connected \n");
    if( write(s , MESSAGE , strlen(MESSAGE)) < 0)
    {
        ESP_LOGE(TAG, "... Send failed \n");
        close(s);
        vTaskDelay(4000 / portTICK_PERIOD_MS);
    }
    ESP_LOGI(TAG, "... socket send success");
    close(s);
   
}


static void echo_task(void *arg)
{
    /* Configure parameters of an UART driver,
     * communication pins and install the driver */
    uart_config_t uart_config = {
        .baud_rate = 9600,
        .data_bits = UART_DATA_8_BITS,
        .parity    = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE,
        .source_clk = UART_SCLK_APB,
    };
    int intr_alloc_flags = 0;
/*--------------------------------------------------------------------------------*/

#if CONFIG_UART_ISR_IN_IRAM
    intr_alloc_flags = ESP_INTR_FLAG_IRAM;
#endif

    ESP_ERROR_CHECK(uart_driver_install(ECHO_UART_PORT_NUM, BUF_SIZE * 2, 0, 0, NULL, intr_alloc_flags));
    ESP_ERROR_CHECK(uart_param_config(ECHO_UART_PORT_NUM, &uart_config));
    ESP_ERROR_CHECK(uart_set_pin(ECHO_UART_PORT_NUM, ECHO_TEST_TXD, ECHO_TEST_RXD, ECHO_TEST_RTS, ECHO_TEST_CTS));

    // Configure a temporary buffer for the incoming data
    //uint8_t *data = (uint8_t *) malloc(BUF_SIZE);
    char data[] = "a";
    char  datatosend[100] ;
    int c = 0;
    int stat = 0;
    while (1) {
        // Read data from the UART
      wifi_ap_record_t ap;
      esp_wifi_sta_get_ap_info(&ap);
      printf("le rssi est de : %d\n",ap.rssi );
      if (ap.rssi < -80){
        char* test_str = "RSF";
        uart_write_bytes(ECHO_UART_PORT_NUM, (const char*)test_str, strlen(test_str));
        stat = 1; 
        esp_deep_sleep(10000000);
      }
      
      if (ap.rssi > -40 && stat ==1){
        stat = 0;
        char* test_str = "RST";
        uart_write_bytes(ECHO_UART_PORT_NUM, (const char*)test_str, strlen(test_str));
      } 
      
        int len = uart_read_bytes(ECHO_UART_PORT_NUM, &data, BUF_SIZE, 20 / portTICK_RATE_MS);
        
        
        //char ca[] = data; 
        if (len != NULL)
        {

         printf("%c \n", data[0]);
         datatosend[c] =  data[0];  

         c ++; 
         if (strcmp ("\r", data) == 0 )
         {
            datatosend[c] = '\0';
            printf("voici la chaine de caracter: %s \n", datatosend);
            c = 0;
            tcp_client(datatosend);

         }
 
        }
        

        // Write data back to the UART
        //uart_write_bytes(ECHO_UART_PORT_NUM, (const char *) data, len);
    }
}



static void initialise_wifi(void *arg)
{
  tcpip_adapter_init();
  ESP_ERROR_CHECK(esp_event_loop_init(event_handler, arg));
  wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
  ESP_ERROR_CHECK(esp_wifi_init(&cfg));
  ESP_ERROR_CHECK(esp_wifi_set_storage(WIFI_STORAGE_RAM));
  wifi_config_t wifi_config = {
      .sta = {
          .ssid = SSID,
          .password = PASSPHARSE,
      },
  };
  ESP_LOGI(TAG, "Setting WiFi configuration SSID %s...", wifi_config.sta.ssid);
  ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
  ESP_ERROR_CHECK(esp_wifi_set_config(ESP_IF_WIFI_STA, &wifi_config));
  ESP_ERROR_CHECK(esp_wifi_start());
}

void app_main()
{
  static httpd_handle_t server = NULL;
  wifi_event_group = xEventGroupCreate();
  ESP_ERROR_CHECK(nvs_flash_init());
  init_camera();
  initialise_wifi(&server);
  xTaskCreate(echo_task, "uart_echo_task", ECHO_TASK_STACK_SIZE, NULL, 10, NULL);
}