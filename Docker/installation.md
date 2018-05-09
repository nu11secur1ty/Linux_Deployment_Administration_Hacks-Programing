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

- where the placeholder ```<DIST>``` is the preferred distribution.

- Install umoci and skopeo tools

```bash
zypper in umoci skopeo
```
- Build the image with KIWI:

