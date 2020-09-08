# Remove `sudo` privileges
# WARNING: THIS IS VERY IMPORTANT FOR ANY SERVERS!

```bash
sed -i 's/root/#root/' /etc/sudoers && sed -i 's/%sudo/#%sudo/' /etc/sudoers
```

