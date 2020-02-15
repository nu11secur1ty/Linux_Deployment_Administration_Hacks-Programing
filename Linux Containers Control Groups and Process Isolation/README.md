Everyone's heard the term, but what exactly are containers?

The software enabling this technology comes in many forms, with Docker as the most popular. The recent rise in popularity of container technology within the data center is a direct result of its portability and ability to isolate working environments, thus limiting its impact and overall footprint to the underlying computing system. To understand the technology completely, you first need to understand the many pieces that make it all possible.

Sidenote: people often ask about the difference between containers and virtual machines. Both have a specific purpose and place with very little overlap, and one doesn't obsolete the other. A container is meant to be a lightweight environment that you spin up to host one to a few isolated applications at bare-metal performance. You should opt for virtual machines when you want to host an entire operating system or ecosystem or maybe to run applications incompatible with the underlying environment.

Linux Control Groups
Truth be told, certain software applications in the wild may need to be controlled or limited—at least for the sake of stability and, to some degree, security. Far too often, a bug or just bad code can disrupt an entire machine and potentially cripple an entire ecosystem. Fortunately, a way exists to keep those same applications in check. Control groups (cgroups) is a kernel feature that limits, accounts for and isolates the CPU, memory, disk I/O and network's usage of one or more processes.

Originally developed by Google, the cgroups technology eventually would find its way to the Linux kernel mainline in version 2.6.24 (January 2008). A redesign of this technology—that is, the addition of kernfs (to split some of the sysfs logic)—would be merged into both the 3.15 and 3.16 kernels.

The primary design goal for cgroups was to provide a unified interface to manage processes or whole operating-system-level virtualization, including Linux Containers, or LXC (a topic I plan to revisit in more detail in a follow-up article). The cgroups framework provides the following:

Resource limiting: a group can be configured not to exceed a specified memory limit or use more than the desired amount of processors or be limited to specific peripheral devices.
Prioritization: one or more groups may be configured to utilize fewer or more CPUs or disk I/O throughput.
Accounting: a group's resource usage is monitored and measured.
Control: groups of processes can be frozen or stopped and restarted.
A cgroup can consist of one or more processes that are all bound to the same set of limits. These groups also can be hierarchical, which means that a subgroup inherits the limits administered to its parent group.

The Linux kernel provides access to a series of controllers or subsystems for the cgroup technology. The controller is responsible for distributing a specific type of system resources to a set of one or more processes. For instance, the memory controller is what limits memory usage while the cpuacct controller monitors CPU usage.

You can access and manage cgroups both directly and indirectly (with LXC, libvirt or Docker), the first of which I cover here via sysfs and the libcgroups library. To follow along with the examples here, you first need to install the necessary packages. On Red Hat Enterprise Linux or CentOS, type the following on the command line:
