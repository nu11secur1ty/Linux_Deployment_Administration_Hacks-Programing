# Exclude a Specific Directory

Excluding a specific directory is same as excluding a file, just pass the relative path to the directory to the `--exclude` option as shown below:

```bash
rsync -a --exclude 'dir1' src_directory/ dst_directory/
```

If you want to exclude the directory content but not the directory itself use `dir1/*` instead of `dir1`:

```bash
rsync -a --exclude 'dir1/*' src_directory/ dst_directory/
```

# Exclude Multiple Files or Directories

To exclude multiple files or directories simply specify multiple `--exclude` options:

```bash
rsync -a --exclude 'file1.txt' --exclude 'dir1/*' --exclude 'dir2' src_directory/ dst_directory/
```

If you prefer to use a single `--exclude` option you can list the files and directories you want to exclude in curly braces `{}` separated by a comma as shown below:
















