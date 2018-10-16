# Download certbot
```bash
git clone https://github.com/certbot/certbot
git clone https://github.com/nu11secur1ty/letsencrypt
```

# Navigate to certbot dir
```bash
cd certbot/
```

# Stop webserver
```bash
rcapache2 stop
```

# Create multiple domain cert usind subdomains - virtual hosts
```bash
./certbot-auto certonly --standalone -d tashaci.com -d golemi.tashaci.com
```
