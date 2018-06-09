
# Cleaning old sub domain certificates
```bash
rm -rf /etc/letsencrypt/live/${DOMAIN}
rm /etc/letsencrypt/renewal/${DOMAIN}.conf
```
