```bash
#!/usr/bin/bash
cd /root/letsencrypt
   rcapache2 stop 
./letsencrypt-auto renew 
   rcapache2 start
exit 0;
```
