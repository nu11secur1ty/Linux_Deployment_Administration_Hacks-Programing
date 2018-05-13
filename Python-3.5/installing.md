# Download Python 3.5 version using the following commands.
```bash
cd /usr/src
wget https://www.python.org/ftp/python/3.5.5/Python-3.5.5.tgz
```
# Now extract the downloaded archive on your system.
```bash
sudo tar xzf Python-3.5.5.tgz
```
- ***Install Python on Linux***
Use below set of commands to compile Python source code on your system using at install. This will install Python on Open Suse leep 42.2, 42.3, 15 and Ubuntu, Debian.


- **Packages**
- For Suse...
```bash
zypper -n in gcc make
```

- **Actions**
```bash
cd Python-3.5.5
sudo ./configure --enable-optimizations
sudo make altinstall
```
# Check:

```bash
 python3.5 -V
```
