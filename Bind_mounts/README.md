 Bind Mounts

Using bind mounts, we can mount all, or even part of an already-mounted filesystem to another location, and have the filesystem accessible from both mount points at the same time! For example, you can use bind mounts to mount your existing root filesystem to /home/drobbins/nifty, as follows:

# mount --bind / /home/drobbins/nifty

Now, if you look inside /home/drobbins/nifty, you'll see your root filesystem (/home/drobbins/nifty/etc, /home/drobbins/nifty/opt, etc.). And if you modify a file on your root filesystem, you'll see the modifications in /home/drobbins/nifty as well. This is because they are one and the same filesystem; the kernel is simply mapping the filesystem to two different mount points for us. Note that when you mount a filesystem somewhere else, any filesystems that were mounted to mount points inside the bind-mounted filesystem will not be moved along. In other words, if you have /usr on a separate filesystem, the bind mount we performed above will leave /home/drobbins/nifty/usr empty. You'll need an additional bind mount command to allow you to browse the contents of /usr at /home/drobbins/nifty/usr:

# mount --bind /usr /home/drobbins/nifty/usr

Or you would need to use recursive bind mount:

# mount --rbind / /home/drobbins/nifty

What this do is telling the kernel to look for any filesystems mounted under / and mount them also under the new bind mount at /home/testing/nifty. This way, if your /usr or /var dirs are on different filesystems you don't need to enter 3 different mount commands, but instead a single one.
Bind mounting parts of filesystems

Bind mounting makes even more neat things possible. Let's say that you have a tmpfs filesystem mounted at /dev/shm, its traditional location, and you decide that you'd like to start using tmpfs for /tmp, which currently lives on your root filesystem. Rather than mounting a new tmpfs filesystem to /tmp (which is possible), you may decide that you'd like the new /tmp to share the currently mounted /dev/shm filesystem. However, while you could bind mount /dev/shm to /tmp and be done with it, your /dev/shm contains some directories that you don't want to appear in /tmp. So, what do you do? How about this:

# mkdir /dev/shm/tmp
# chmod 1777 /dev/shm/tmp
# mount --bind /dev/shm/tmp /tmp

In this example, we first create a /dev/shm/tmp directory and then give it 1777 perms, the proper permissions for /tmp. Now that our directory is ready, we can mount /dev/shm/tmp, and only /dev/shm/tmp to /tmp. So, while /tmp/foo would map to /dev/shm/tmp/foo, there's no way for you to access the /dev/shm/bar file from /tmp.

As you can see, bind mounts are extremely powerful and make it easy to make modifications to your filesystem layout without any fuss. Next article, we'll check out devfs; for now, you may want to check out the following resources. 
