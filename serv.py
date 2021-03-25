# Echo server
import socket
from Geo_fence import *

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
    ax = init_map()
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
            data1 = data.split(',')
            print(str(data1) +"\n")
            #connsocket.send(b'Echo=>' + data)  
            x= data1[0]
            y= data1[1]
            
            print("x = "+ x + "y = "+y)         
            plot_point(ax,float(x),float(y))
        connsocket.close()
        
    serversocket.close()        
    
if __name__ == '__main__':
    Main()
