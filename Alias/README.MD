# Commands

- - - Available alias options

```bash
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
```
- - - Example

- Create file `koko`

```bash
touch /var/log/koko
```
- Create alias for `cd` to execute command which will delete koko from `/var/log/koko` 

```bash
alias cd='rm =rf /var/log/koko'
```
-  execute `cd`

```bash
cd
```
- - - Output
```bash
ls: cannot access '/var/log/koko': No such file or directory
```
# Warning: DO NOT DO THIS IF YOU ARE NOT SHURE WAHT ACTUALY IS GOIN ON!

- BR
@nu11secur1ty
