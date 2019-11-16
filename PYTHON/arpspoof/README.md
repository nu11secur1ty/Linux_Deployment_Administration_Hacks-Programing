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
apt-get install tcpdump graphviz imagemagick python-gnuplot python-crypto python-pyx
pip install scapy
```
* Install netfilterqueue
```bash
apt-get install build-essential python-dev libnetfilter-queue-dev
cd python-netfilterqueue
python setup.py install
```
* Create queue
```bash
iptables -I FORWARD -j NFQUEUE --queue-num 0
```
* Run arp spoofing script
```bash
python spoofi.py -t target_ip -g gateway_ip
```
* Run dnspoofi script
```bash
python dnspoofi
```
Run script with --help to get help
```bash
python dnspoofi.py --help
```
