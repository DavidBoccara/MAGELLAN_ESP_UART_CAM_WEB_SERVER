# Echo server
import socket
from Geo_fence import *

"""
def Main():
    HOST = '' #specifies that the socket is reachable by any address the machine happens to have
    PORT = 5000

    # create an INET, TCP socket
    serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    # bind the socket to a public host, and a well-known port
    serversocket.bind((HOST, PORT))
    
    # become a server socket
    serversocket.listen(2)

    data1 = [""]
    dt = init_map()
    ax = dt[0]
    fig = dt[1]
    cnt =0
    while True:
        # accept connections from outside
        (connsocket, address) = serversocket.accept()    

        print("Connection from: ", address)

        # Read data

        while True:
            data = connsocket.recv(1024)
            if not data: break            
            print("from connected user: ", data.decode()) # convert from byte to string
            #data = str(data).replace("\r", '')
            data = data.decode()
            data = str(data).replace("\r", '')
            dicto = parse_GPRMC(data)
            
            connsocket.send(b'Echo=>' + data)    
            plot_point(ax,dicto['decimal_longitude'],dicto['decimal_latitude'])

            if cnt ==0 : 
                text_plot(fig,str(dicto['baro']))
                cnt = 1
            else:
                text_plot(fig,"    ")
                text_plot(fig,"    ")
                text_plot(fig,"    ")
                text_plot(fig,"    ")
                text_plot(fig,"    ")
                text_plot(fig,"    ")
                cnt = 0
        connsocket.close()
        
    serversocket.close()        
    
if __name__ == '__main__':
    Main()
"""

def degrees_to_decimal(data, hemisphere):
    try:
        decimalPointPosition = data.index('.')
        degrees = float(data[:decimalPointPosition-2])
        minutes = float(data[decimalPointPosition-2:])/60
        output = degrees+minutes
        if hemisphere == 'N' or hemisphere == 'E' :
            return output
        if hemisphere == 'S' or hemisphere == 'W': 
            return -output
    except:
        return ""

def parse_GPRMC(data):
    data = data.split(',')
    if 'B' in  data[0] :
        dict = {
            'baro' : data[0].replace("B", ""), 
            'fix_time': data[2],
            'latitude': data[3],
            'latitude_hemisphere' : data[4],
            'longitude' : data[5],
            'longitude_hemisphere' : data[6],
            'speed': data[7],
            'true_course': data[8],
            'fix_date': data[9],
            'variation': data[10],
            'variation_e_w': data[11],
            'checksum' : data[12]    
            }
        dict['decimal_latitude'] = degrees_to_decimal(dict['latitude'],dict['latitude_hemisphere'])
        dict['decimal_longitude'] = degrees_to_decimal(dict['longitude'],dict['longitude_hemisphere'])
        return dict

data = "B1023.43,$GNGGA,142630.00,4848.84014,N,00223.73455,E,1,04,6.69,40.2,M,46.2,M,,*71"
dat = parse_GPRMC(data)
print(dat)
dt = init_map()
ax = dt[0]
fig = dt[1]
cnt1 = 36
cnt =0

while True:

    if cnt ==0 :
        plot_point(ax,dat['decimal_longitude'],dat['decimal_latitude']) 
        cnt1 +=1
        print(cnt)
        text_plot(fig,str(cnt1))
        cnt = 1
    else:
        text_plot(fig,"    ")
        text_plot(fig,"    ")
        text_plot(fig,"    ")
        text_plot(fig,"    ")
        text_plot(fig,"    ")
        text_plot(fig,"    ")
        cnt = 0
    

