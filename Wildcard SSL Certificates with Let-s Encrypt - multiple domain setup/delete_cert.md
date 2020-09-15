# Delete Certbot Certificate by Domain Name

`Reader Tim Thorp kindly provided a more immediate way to delete a Certbot certificate by including the domain name in the command like this:`

```bash
certbot delete --cert-name example.com
./certbot-auto delete --cert-name example.com
./letsencrypt-auto delete --cert-name domain.example.com
```

