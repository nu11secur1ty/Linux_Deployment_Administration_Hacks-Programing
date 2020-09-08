# Remove `sudo` privileges

- - - Ubuntu

```bash
sed -i 's/root/#root/' /etc/sudoers && sed -i 's/%sudo/#%sudo/' /etc/sudoers
```
