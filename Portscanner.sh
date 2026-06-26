#!/usr/bin/python3
import socket
ip=input("Enter the ip:")
start=int(input("Start port:"))
end=int(input("End port:"))
for port in range(start,end+1):
   s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
   s.settimeout(0.5)
   result=s.connect_ex((ip,port))
   try:
       service=socket.getservbyport(port, "tcp")
   except OSError:
       service="Unknown"

   if result == 0:
      print(f"[+] Port {port} ({service}) is OPEN")
   else:
      print(f"[-] Port {port} ({service}) is CLOSED")
   s.close()