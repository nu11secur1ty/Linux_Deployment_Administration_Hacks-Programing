# prefork MPM
# StartServers: number of server processes to start
# MinSpareServers: minimum number of server processes which are kept spare
# MaxSpareServers: maximum number of server processes which are kept spare
# ServerLimit: maximum value for MaxClients for the lifetime of the server
# MaxClients: maximum number of server processes allowed to start
# MaxRequestsPerChild: maximum number of requests a server process serves
```bash
<IfModule prefork.c>
StartServers       4
MinSpareServers    3
MaxSpareServers   10
ServerLimit      256
MaxClients       256
MaxRequestsPerChild  10000
</IfModule>
```
