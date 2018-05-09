# Installation of KIWI:
![](https://github.com/nu11secur1ty/Linux_Deployment_Administration_Hacks/blob/master/Docker/kiwi-logo.png)


KIWI can be installed with different methods. For this guide, only the installation as a packages through a package manager is described.

Packages for the new KIWI version are provided at the openSUSE buildservice.
- To install KIWI, do:
Open the [URL](http://download.opensuse.org/repositories/Virtualization:/Appliances:/Builder) in your browser.
Right-click on the link of your preferred operating system and copy the URL. In Firefox it is the menu Copy link address.

Insert the copied URL from the last step in your shell. The ```DIST``` placeholder contains the respective distribution. Use zypper ar to add it to your list of repositories:

```bash
sudo zypper ar -f http://download.opensuse.org/repositories/Virtualization:/Appliances:/Builder/<DIST>
```
# The command must be:
```bash
zypper ar -f http://download.opensuse.org/repositories/Virtualization:/Appliances:/Builder/openSUSE_Tumbleweed/ gashnik
```

# Install KIWI:
# Note:

Multipython packages

This version of KIWI is provided for python 2 and python 3 versions. The following information is based on the installation of the python3-kiwi package

```bash
zypper in python3-kiwi
```
# Example Appliance Descriptions:

For use with the next generation KIWI there is also a GitHub project hosting example appliance descriptions. Users who need an example to start with should checkout the project as follows:

```bash
git clone https://github.com/SUSE/kiwi-descriptions
```

------------------------------------------------------------------------------------------------------------------


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
zypper ar -f http://download.opensuse.org/repositories/Virtualization:/containers/openSUSE_Tumbleweed/ tupunger
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

# Have fun ;)

