# How to change from default to alternative Python version path on Open SUSE Leep, Debian.

Your Debian Linux installation may include multiple python versions and thus also include multiple python binary executables. 
You can run the following ls command to find out what python binary executables are available on your system: 

```bash
$ ls /usr/bin/python*
/usr/bin/python  /usr/bin/python2  /usr/bin/python2.7  /usr/bin/python3  /usr/bin/python3.4  /usr/bin/python3.4m  /usr/bin/python3m
```
# To check what is your default python version execute: 

```bash 
$ python --version
Python 2.7.8
```
# Change temporary:
```bash
alias python='/usr/bin/python3.4'
```
# Change permanet:
```bash
sudo rm /usr/bin/python
sudo ln -s /usr/bin/python3.4 /usr/bin/python
```
# Check
```bash
python --version
```
# List avalible:
```bash
ls /usr/bin/ | grep python
```

