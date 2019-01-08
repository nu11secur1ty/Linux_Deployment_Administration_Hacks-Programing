all: suid
suid: main.c
  gcc -o displayeuid main.c
install: suid
  mkdir -p ${RPM_BUILD_ROOT}/usr/bin
  cp displayeuid ${RPM_BUILD_ROOT}/usr/bin
