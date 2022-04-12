## Check the processes if they are down and picking them up

![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks-Programing/blob/master/CHECK-PROC-IF-IT-DOWN/proc.png)

## cron

```bash
*/15 * * * *    bash /home/your_user/vpn/openvpn_check.sh >> /home/your_user/vpn/openvpn_check.log 2>&1
```
