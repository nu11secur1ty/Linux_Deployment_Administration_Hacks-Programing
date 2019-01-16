# How to password protect a single file
```bash
<FilesMatch "your_file.xxx">
  AuthName "Member Only"
  AuthType Basic
  AuthUserFile /path/touserpassword/.htpasswd
  require valid-user
</FilesMatch>
```
