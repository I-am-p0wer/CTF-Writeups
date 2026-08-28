## Bandit_3

Bandit Level 2 → Level 3

Level Goal

The password for the next level is stored in a file called --spaces in this filename-- located in the home directory

Commands you may need to solve this level

ls , cd , cat , file , du , find

Helpful Reading Material

## Solution

```bash
bandit3@bandit:~$ ls
inhere
bandit3@bandit:~$ cd inhere/
bandit3@bandit:~/inhere$ ls -al
total 12
drwxr-xr-x 2 root    root    4096 Jun 24 14:59 .
drwxr-xr-x 3 root    root    4096 Jun 24 14:59 ..
-rw-r----- 1 bandit4 bandit3   33 Jun 24 14:59 ...Hiding-From-You
bandit3@bandit:~/inhere$ 
bandit3@bandit:~/inhere$ cat ...Hiding-From-You
xzTXq1rDJQVVAzdv5cHq1TQytTWufAMq
```