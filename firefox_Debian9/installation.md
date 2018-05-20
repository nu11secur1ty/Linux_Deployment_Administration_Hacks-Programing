# Installing:
```bash
cd /opt/
wget https://ftp.mozilla.org/pub/firefox/releases/61.0b6/linux-x86_64/en-US/firefox-61.0b6.tar.bz2
tar -xvf firefox-61.0b6.tar.bz2
cd firefox/
mv /usr/lib/firefox-esr/firefox-esr /usr/lib/firefox-esr/firefox-esr_orig
ln -s /opt/firefox/firefox /usr/lib/firefox-esr/firefox-esr
```
# Reload Firefox
# Have fun ;)
