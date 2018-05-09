# Build a Docker Container Image using KIWI:

KIWI is capable of building native Docker images, from scratch and derived ones. KIWI Docker images are considered to be native since the KIWI tarball image is ready to be loaded to a Docker daemon, including common container configurations.

The Docker configuration metadata is provided to KIWI as part of the XML description file using the
```xml
<containerconfig> tag.
```
The following configuration metadata can be specified:

# The following example shows how to build a Docker base image based on openSUSE Leap:

- Make sure you have checked out the example image descriptions, see Example [Appliance Descriptions.](https://suse.github.io/kiwi/installation.html#example-descriptions)

- Include the ```Virtualization```repository to your list:

```bash
zypper ar -f http://download.opensuse.org/repositories/Virtualization:/containers/<DIST>
```
# NOTE: The path of the command must be:
```bash
zypper ar -f http://download.opensuse.org/repositories/Virtualization:/containers/openSUSE_Tumbleweed/
```
- WARNING: You must update your virtual machine:
```bash
zypper up
zypper dup
```


--------------------------------------------------------------------------------------------------

- where the placeholder ```<DIST>``` is the preferred distribution.

- Install umoci and skopeo tools

```bash
zypper in umoci skopeo
```
- Build the image with KIWI:

```bash
$ sudo kiwi-ng --type docker system build --description kiwi-descriptions/suse/x86_64/suse-tumbleweed-docker --target-dir /your/image
```
- Test the Docker image.<i>First load the new image</i>:

```bash 
docker load -i openSUSE-Tumbleweed-container-image.x86_64-1.0.4.docker.tar.xz
```
- then run the loaded image:

```bash
docker run -it opensuse:42.2 /bin/bash
```
# Output must be:

```bash
bash-4.3# cat /etc/*release
openSUSE 42.2 (x86_64)
VERSION = 42.2
CODENAME = Malachite
# /etc/SuSE-release is deprecated and will be removed in the future, use /etc/os-release instead
NAME="openSUSE Leap"
VERSION="42.2"
ID=opensuse
ID_LIKE="suse"
VERSION_ID="42.2"
PRETTY_NAME="openSUSE Leap 42.2"
ANSI_COLOR="0;32"
CPE_NAME="cpe:/o:opensuse:leap:42.2"
BUG_REPORT_URL="https://bugs.opensuse.org"
HOME_URL="https://www.opensuse.org/"
bash-4.3# 








```


![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks/blob/master/Docker/Screenshot_20180509_131800.png)

