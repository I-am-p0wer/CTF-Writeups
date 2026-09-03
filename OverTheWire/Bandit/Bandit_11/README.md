## Bandit_11

Bandit Level 11 → Level 12

Level Goal

The password for the next level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions

Commands you may need to solve this level

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

## Solution

```bash
bandit11@bandit:~$ ls
data.txt

bandit11@bandit:~$ cat data.txt 
Gur cnffjbeq vf TEBbmJCB8DlA0zTewHxVQ0JPLxMvDkeA

bandit11@bandit:~$ cat data.txt | tr "A-Za-z"  "N-ZA-Mn-za-m"

The password is GROozWPO8QyN0mGrjUkID0WCYkZiQxrN
```