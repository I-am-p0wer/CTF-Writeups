## Bandit_18

Bandit Level 18 → Level 19

Level Goal

The password for the next level is stored in a file **readme** in the homedirectory. Unfortunately, someone has modified **.bashrc** to log you out when you log in with SSH.

Commands you may need to solve this level

ssh, ls, cat

## Solution

```bash
ssh bandit18@bandit.labs.overthewire.org -p 2220 /bin/sh
bandit18@bandit.labs.overthewire.org's password:OQxXZjELndr90zuhOTDYBEomI0SZITXI
```

```bash
ls
readme
```

```
cat readme
KpsOfPkcP7i1FlIExk2QEjyt6dw8dxZI
```