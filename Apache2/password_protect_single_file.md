# Add in to a your .htaccess file
```bash
<FilesMatch "your_file.xxx">
  AuthName "Member Only"
  AuthType Basic
  AuthUserFile /home/username/.htpasswd
  require valid-user
</FilesMatch>
```
