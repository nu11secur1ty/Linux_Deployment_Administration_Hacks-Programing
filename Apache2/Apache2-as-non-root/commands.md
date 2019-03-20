# Installing depend on Open Suse Leap 42.3

- Download openssl:

```bash
wget https://www.openssl.org/source/openssl-1.0.2r.tar.gz
tar -xvf openssl-1.0.2r.tar.gz
cd openssl-1.0.2r/
mkdir -p openssl
./config --prefix=/home/apache-management/httpd/openssl -fPIC
make 
make install

```

- Download pcre:

```bash
wget https://ftp.pcre.org/pub/pcre/pcre-8.43.tar.gz
tar -xvf pcre-8.43.tar.gz
cd pcre-8.43/
mkdir -p pcre
./configure --prefix=/home/apache-management/httpd/pcre --enable-jit
make
make install
```

- Download APR:

```bash
cd httpd-2.4.38/
./buildconf
svn co http://svn.apache.org/repos/asf/apr/apr/trunk srclib/apr # if ./building is not started
./buildconf
make 
make install


# Directory

```bash
mkdir -p opt/
mkdir -p opt/applications/
```

# Installing Apache as non root:

```bash
cd /home/apache-management/httpd-2.4.38/srclib/apr/
./buildconfig
cd ..
cd httpd-2.4.38/
./configure --prefix=/home/apache-management/apache --enable-mods-shared=all --enable-ssl --enable-sslstatic-lib-debs --with-ssh=/home/apache-management/openssl --with-pcre=/home/apache-management/pcre --enable-suexec --enable-so --with-includet-arp --enable-mpms-shared=all --enable-proxy --enable-proxy-http --enable-proxy-connect --enable-proxy-ajp --enable-rewrite --with-zlib --with-included-apr
make
make install
```
# Configure Apache
- on httpd.conf
```bash
vim apache/conf/httpd.conf
```
- change this

```bash
#Listen 80 # for root
Listen 8080 # for user
```



