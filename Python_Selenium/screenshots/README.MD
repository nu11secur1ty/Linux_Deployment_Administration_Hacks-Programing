# Screen
![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks-Programing/blob/master/Python_Selenium/screenshots/google.png)

# installing packages

- NOTE: for OpenSuse Leap42.3
```bash
zypper install python-pip
zypper install python-pip3
```
# Installing google-chrome on the server
```bash
zypper addrepo http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome
zypper refresh
wget https://dl.google.com/linux/linux_signing_key.pub
rpm --import linux_signing_key.pub
zypper install google-chrome-stable
```
- Run as root
```bash
vim /usr/bin/google-chrome
```
- Change:
```bash
# Note: exec -a below is a bashism.
exec -a "$0" "$HERE/chrome" "$@"
```
- to:
```bash
# Note: exec -a below is a bashism.
exec -a "$0" "$HERE/chrome" "$@" --no-sandbox
```

---------------------------------------------------------------------
# Installing Selenium on the server:

- selenium
```bash
pip install selenium
pip3 install selenium
```

- Chrome driver
```link
http://chromedriver.chromium.org/downloads
cd /path/to/your/location/ 
wget https://chromedriver.storage.googleapis.com/79.0.3945.16/chromedriver_linux64.zip
```
- Specify the path of your "chromedriver"
```bash
chromedriver = '/path/path/chromedriver'
```
# Executing
- Run google.py
```bash
python google.py
```
# NOTE: 2020

- For the new project, I use the `ChromeDriver 79 version` which is needed for the Chrome Web browser 79 version!

# Enjoy ;)
