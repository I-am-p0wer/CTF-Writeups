## Bandit_10

Bandit Level 10 → Level 11

Level Goal

The password for the next level is stored in the file data.txt, which contains base64 encoded data

Commands you may need to solve this level

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

## Solution

```Bash
bandit10@bandit:~$ ls
data.txt

bandit10@bandit:~$ cat data.txt 
VGhlIHBhc3N3b3JkIGlzIHBZZk9ZNkh3VXNEajVyTDlVdnloVTdNQ212OHZONVJvCg==

bandit10@bandit:~$ cat data.txt |base64 -d
The password is pYfOY6HwUsDj5rL9UvyhU7MCmv8vN5Ro
```