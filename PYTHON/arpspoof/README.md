# Usage ARPSPOOF:
```bash
$python spoofi.py -t 10.0.2.4 -g 10.0.2.1
```
- `t` ***Target***
- `g` ***Gateway***


---------------------------------------------------------------------------------------------------------

# Usage DNSPOOF

* Install scupy
```bash
pip install scapy
```
* Install netfilterqueue
```bash
pip install netfilterqueue
```
* Create queue
```bash
iptables -I FORWARD -j NFQUEUE --queue-num 0`
```
* Run arp spoofing script
```bash
python spoofi.py -t target_ip -g gateway_ip
```
* Run dns_spoofing script
```bash
python dns_spoofing
```
Run script with --help to get help
```bash
python dnspoofi.py --help
```
