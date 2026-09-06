## Bandit_19

Bandit Level 19 → Level 20

Level Goal

To gain access to the next level, you should use the setuid binary in the homedirectory. Execute it without arguments to find out how to use it. The password for this level can be found in the usual place (/etc/bandit_pass), after you have used the setuid binary.

## Solution

Pass
```bash
KpsOfPkcP7i1FlIExk2QEjyt6dw8dxZI
```

```Bash
bandit19@bandit:~$ ls
bandit20-do
```

```bash
bandit19@bandit:~$ ls -al
total 36
drwxr-xr-x   2 root     root      4096 Jun 24 14:58 .
drwxr-xr-x 150 root     root      4096 Jun 24 15:02 ..
-rw-r--r--   1 root     root       220 Feb 13  2026 .bash_logout
-rw-r--r--   1 root     root      3851 Jun 24 14:50 .bashrc
-rw-r--r--   1 root     root       807 Feb 13  2026 .profile
-rwsr-x---   1 bandit20 bandit19 14880 Jun 24 14:58 bandit20-do
```

```bash
bandit19@bandit:~$ ./bandit20-do 
Run a command as another user.
  Example: ./bandit20-do whoami
```

```bash
bandit19@bandit:~$ ./bandit20-do whoami
bandit20
```

```bash
bandit19@bandit:~$ ./bandit20-do cat /etc/bandit_pass/bandit20 
4pIjcunZ0fK2vmp3IwfG8Vf7VhxD6pOA
```