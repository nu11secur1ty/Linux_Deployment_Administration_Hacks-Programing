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

```bash
rsync -a --exclude={'file1.txt','dir1/*','dir2'} src_directory/ dst_directory/
```

If the number of the files and/or directories you want to exclude is large, instead of using multiple `--exclude` options you can specify the files and directories you want to exclude in a file and pass the file to the `--exclude-from` option.

The command below does exactly the same as the one above:

```bash
rsync -a --exclude-from='exclude-file.txt' src_directory/ dst_directory/
```

`exclude-file.txt`

```
file1.txt
dir1/*
dir2
```

# Exclude Multiple Files or Directories Based on a Pattern

With rsync you can also exclude files and directories based on a pattern that matches the file or directory name.
For example, to exclude all `.jpg` files you would run:

```bash
rsync -a --exclude '*.jpg*' src_directory/ dst_directory/
```


It is little trickier to exclude all other files and directories except those that match a certain pattern. Let’s say you want to exclude all other files and directories except the files ending with `.jpg`.

One option is to use the following command:


```bash
rsync -a -m --include='*.jpg' --include='*/' --exclude='*' src_directory/ dst_directory/
```

When using multiple include/exclude option, the first matching rule applies.

- `--include='*.jpg'` - First we are including all .jpg files.
`
-  `--include='*/'` - Then we are including all directories inside the in src_directory directory. Without this rsync will 

only copy *.jpg files in the top level directory.

- -m - Removes the empty directories.

Another option would be to pipe the output of the find command to rsync:

```bash
find src_directory/ -name "*.jpg" -printf %P\\0\\n | rsync -a --files-from=- src_directory/ dst_directory/
```

- `-printf %P\\0\\n` - will remove the src_directory/ from the file path.
- `--files-from=-` - means include only the files from the standard input (files passed from the find command).

# Conclusion
In this tutorial, you learned how to exclude files and directories when transferring data with Rsync. There’s lots more to learn about Rsync at Rsync User’s Manual page.
