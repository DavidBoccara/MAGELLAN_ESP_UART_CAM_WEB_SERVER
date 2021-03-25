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

static EventGroupHandle_t wifi_event_group;
const int CONNECTED_BIT = BIT0;

#define AP_TARGET_SSID "Wifidrone"
#define AP_TARGET_PASSWORD "boboboc68"
//#define AP_TARGET_SSID "BOCCARA"
//#define AP_TARGET_PASSWORD "strongriver451"
//#define AP_TARGET_SSID "Livebox-BF50"
//#define AP_TARGET_PASSWORD "YjynsdzcmeA3icpA9Z"
#define ECHO_TEST_RTS (UART_PIN_NO_CHANGE)
#define ECHO_TEST_CTS (UART_PIN_NO_CHANGE)
#define ECHO_UART_PORT_NUM      (0)
#define ECHO_TEST_TXD   (1)
#define ECHO_TEST_RXD   (3)
#define ECHO_TASK_STACK_SIZE (2048)
#define BUF_SIZE (1024)

/* if code below is uncommented static ip is used */ 
/*
#define DEVICE_IP          "192.168.178.4"
#define DEVICE_GW          "192.168.178.1"
#define DEVICE_NETMASK     "255.255.255.0"
*/

#define HDR_200 "HTTP/1.1 200 OK\r\nContent-type: text/html\r\n\r\n"
#define HDR_201 "HTTP/1.1 201 Created\r\nContent-type: text/html\r\n\r\n"
#define HDR_204 "HTTP/1.1 204 No Content\r\nContent-type: text/html\r\n\r\n"
#define HDR_404 "HTTP/1.1 404 Not Found\r\nContent-type: text/html\r\n\r\n"
#define HDR_405 "HTTP/1.1 405 Method not allowed\r\nContent-type: text/html\r\n\r\n"
#define HDR_409 "HTTP/1.1 409 Conflict\r\nContent-type: text/html\r\n\r\n"
#define HDR_501 "HTTP/1.1 501 Not Implemented\r\nContent-type: text/html\r\n\r\n"
#define configTOTAL_HEAP_SIZE ( 4096 )
static const char *payload = "Message from ESP32 ";
QueueHandle_t MyQueueHandleId = NULL;






static void echo_task(void *arg)
{
    /* Configure parameters of an UART driver,
     * communication pins and install the driver */
    uart_config_t uart_config = {
        .baud_rate = 115200,
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
    while (1) {
        // Read data from the UART
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

            if(pdTRUE == xQueueSend(MyQueueHandleId,&datatosend,100))
            {
             
                printf("\n\rTask2: Successfully sent the data \n");

            }
            else
            {
                printf("\n\rSending Failed\n");
            }
         }
 
        }
        

        // Write data back to the UART
        //uart_write_bytes(ECHO_UART_PORT_NUM, (const char *) data, len);
    }
}

static esp_err_t event_handler(void *ctx, system_event_t *event)
{
    switch(event->event_id) {
        case SYSTEM_EVENT_STA_START:
            esp_wifi_connect();
            break;
        case SYSTEM_EVENT_STA_GOT_IP:
            xEventGroupSetBits(wifi_event_group, CONNECTED_BIT);
            break;
        case SYSTEM_EVENT_STA_DISCONNECTED:
            esp_wifi_connect();
            xEventGroupClearBits(wifi_event_group, CONNECTED_BIT);
            break;
        default:
            break;
    }
    return ESP_OK;
}

/*--------------------------------------------------------------------------------*/

static void initialise_wifi(void)
{
    tcpip_adapter_init();
    wifi_event_group = xEventGroupCreate();
    ESP_ERROR_CHECK( esp_event_loop_init(event_handler, NULL) );
    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
/*--------------------------------------------------------------------------------*/

#ifdef DEVICE_IP
    tcpip_adapter_dhcpc_stop(TCPIP_ADAPTER_IF_STA);
    tcpip_adapter_ip_info_t ipInfo;
    inet_pton(AF_INET, DEVICE_IP, &ipInfo.ip);
    inet_pton(AF_INET, DEVICE_GW, &ipInfo.gw);
    inet_pton(AF_INET, DEVICE_NETMASK, &ipInfo.netmask);
    tcpip_adapter_set_ip_info(TCPIP_ADAPTER_IF_STA, &ipInfo);
#endif

    ESP_ERROR_CHECK( esp_wifi_init(&cfg) );
    ESP_ERROR_CHECK( esp_wifi_set_storage(WIFI_STORAGE_RAM) );
    ESP_ERROR_CHECK( esp_wifi_set_mode(WIFI_MODE_STA) );
    wifi_config_t sta_config = {
        .sta = {
            .ssid = AP_TARGET_SSID,
            .password = AP_TARGET_PASSWORD,
            .bssid_set = false
        }
    };

  ESP_ERROR_CHECK( esp_wifi_set_config(WIFI_IF_STA, &sta_config) );
  ESP_ERROR_CHECK( esp_wifi_start() );
}
//-------------------------------------------------------------------


static void wait_for_ip()
{
    uint32_t bits = CONNECTED_BIT ;

    printf( "Waiting for AP connection...\n");
    xEventGroupWaitBits(wifi_event_group, bits, false, true, portMAX_DELAY);
    printf( "Connected to AP\n");
}

static void tcp_client_task(void *pvParameters)
{
    char rx_buffer[128];
    char addr_str[128];
    int addr_family;
    int ip_protocol;

    while (1) {


        struct sockaddr_in destAddr;
        destAddr.sin_addr.s_addr = inet_addr("192.168.43.186");
        destAddr.sin_family = AF_INET;
        destAddr.sin_port = htons(5000);
        addr_family = AF_INET;
        ip_protocol = IPPROTO_IP;
        inet_ntoa_r(destAddr.sin_addr, addr_str, sizeof(addr_str) - 1);

        int sock =  socket(addr_family, SOCK_STREAM, ip_protocol);
        if (sock < 0) {
            printf( "Unable to create socket: errno %d\n", errno);
            break;
        }
        printf("Socket created\n");

        int err = connect(sock, (struct sockaddr *)&destAddr, sizeof(destAddr));
        if (err != 0) {
            printf( "Socket unable to connect: errno %d\n", errno);
        }
        printf("Successfully connected\n");
        char  resp[200] ;//= "a";
        //char  respA[200] ;//= "a";
          char * http_index_html =  (char *) malloc( 200 ) ;
          char * http_index_htmla =  (char *) malloc( 200 ) ;

        while (1) {

            
            xQueueReceive(MyQueueHandleId,&resp,(TickType_t )(1000/portTICK_PERIOD_MS)); 
            

            vTaskDelay(1000/portTICK_PERIOD_MS); 
          
            printf("value received on queue: %s \n",resp);
            strcat(http_index_html, resp);
            printf("la dif est : %d \n",(http_index_htmla-http_index_html));
            //{
            //    printf("0\n");
            //}
            //else
               // {
            //    printf("1\n");
            //}

            http_index_htmla= http_index_html;
            
            int err = send(sock, http_index_html, strlen(http_index_html), 0);
            if (err < 0) {
                printf( "Error occured during sending: errno %d\n", errno);
                break;
            }

            int len = recv(sock, rx_buffer, sizeof(rx_buffer) - 1, 0);
            // Error occured during receiving
            if (len < 0) {
                printf( "recv failed: errno %d\n", errno);
                break;
            }
            // Data received
            else {
                rx_buffer[len] = 0; // Null-terminate whatever we received and treat like a string
                printf("Received %d bytes from %s:\n", len, addr_str);
                printf("%s", rx_buffer);
            }

            vTaskDelay(2000 / portTICK_PERIOD_MS);
        }

        if (sock != -1) {
            printf(  "Shutting down socket and restarting...\n");
            shutdown(sock, 0);
            close(sock);
        }
    }
    vTaskDelete(NULL);
}



/*--------------------------------------------------------------------------------*/
static void http_server_netconn_serve(struct netconn *conn)
{
    struct netbuf *inbuf;
    char *buf, *payload, *start, *stop;
    u16_t buflen;
    err_t err;

  /* Read the data from the port, blocking if nothing yet there.
   We assume the request (the part we care about) is in one netbuf */
    err = netconn_recv(conn, &inbuf);

    if (err == ERR_OK) {
        netbuf_data(inbuf, (void**)&buf, &buflen);
        // find the first and seconds space (those delimt the url)
        start = strstr(buf, " ");
        stop = strstr(start + 1, " ");  
        // allocate memory for the payload
        payload = (char *) malloc(stop - start + 1);
        memcpy(payload, start, stop - start);
        payload[stop - start] = '\0';
        char  resp[200] ;//= "a";
       
        if(MyQueueHandleId == NULL){
            printf("Queue is not ready \n");
            return;
        }
        
        xQueueReceive(MyQueueHandleId,&resp,(TickType_t )(1000/portTICK_PERIOD_MS)); 
        vTaskDelay(1000/portTICK_PERIOD_MS); 
        char * http_index_html =  (char *) malloc( 200 ) ;
       printf("value received on queue: %s \n",resp);

       
       strcpy(http_index_html, "<!DOCTYPE html><html><head><title>dada</title></head><body><h1>your pos is :");
       strcat(http_index_html, resp);
       strcat(http_index_html, "</h1></body></html>");
       printf(" %s \n",http_index_html);
        
        //printf("%s\n", resp);
        if (strncmp(buf, "GET /", 5) == 0){
            printf("GET = '%s' \n", payload);
            /* send HTTP Ok to client */
            netconn_write(conn, HDR_200, sizeof(HDR_200)-1, NETCONN_NOCOPY);
            /* send "hello world to client" */
            netconn_write(conn, http_index_html, 97-1, NETCONN_NOCOPY);

        }else if (strncmp(buf, "POST /", 6) == 0){
            /* send '501 Not implementd' reply  */
            netconn_write(conn, HDR_501, sizeof(HDR_501)-1, NETCONN_NOCOPY);
        }else if (strncmp(buf, "PUT /", 5) == 0){
            netconn_write(conn, HDR_501, sizeof(HDR_501)-1, NETCONN_NOCOPY);
        }else if (strncmp(buf, "PATCH /", 7) == 0){
            /* send '501 Not implementd' reply  */
            netconn_write(conn, HDR_501, sizeof(HDR_501)-1, NETCONN_NOCOPY);
        }else if (strncmp(buf, "DELETE /", 8) == 0){
            /* send '501 Not implementd' reply  */
            netconn_write(conn, HDR_501, sizeof(HDR_501)-1, NETCONN_NOCOPY);
        }else{
            /*  Any unrecognized verb will automatically 
                result in '501 Not implementd' reply */
            netconn_write(conn, HDR_501, sizeof(HDR_501)-1, NETCONN_NOCOPY);
        }
        free(payload);
    }
    /* Close the connection (server closes in HTTP) and clean up after ourself */
    netconn_close(conn);
    netbuf_delete(inbuf);
}
/*--------------------------------------------------------------------------------*/

static void http_server(void *pvParameters)
{
    uint32_t port;
    if (pvParameters == NULL){
        port = 80;
    }else{
        port = (uint32_t) pvParameters;
    }
    // printf("\n Creating socket at\n %d \n", (uint32_t) pvParameters);
    struct netconn *conn, *newconn;
    err_t err;
    conn = netconn_new(NETCONN_TCP);
    netconn_bind(conn, NULL,  port);
    netconn_listen(conn);
    do {
        err = netconn_accept(conn, &newconn);
        if (err == ERR_OK) {
            http_server_netconn_serve(newconn);
            netconn_delete(newconn);
        }
    } while(err == ERR_OK);
    netconn_close(conn);
    netconn_delete(conn);
}
/*--------------------------------------------------------------------------------*/


int app_main(void)
{
    nvs_flash_init();
    initialise_wifi();
    //xTaskCreate(&http_server, "http_server", 2048, NULL, 5, NULL);
    wait_for_ip();
    MyQueueHandleId=xQueueCreate(20,200);
    //MyQueueHandleId = NULL;
    if(MyQueueHandleId != NULL)
    {
    printf("queue create!!\n");
    xTaskCreate(echo_task, "uart_echo_task", ECHO_TASK_STACK_SIZE, NULL, 10, NULL);
    //xTaskCreate(&http_server, "http_server", 2048, NULL, 5, NULL);
    //xTaskCreate(resp_test, "resp_test",2048 ,NULL, 5, NULL);
    xTaskCreate(tcp_client_task,"tcp_client_task",2048,NULL,5,NULL);
    }
    return 0;
}