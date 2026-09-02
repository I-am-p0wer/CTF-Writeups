## Bandit_7

Bandit Level 7 → Level 8

Level Goal

The password for the next level is stored in the file data.txt next to the word millionth

Commands you may need to solve this level

man, grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

## Solution

```Bash
bandit7@bandit:~$ ls
data.txt

bandit7@bandit:~$ strings data.txt | grep "millionth"

millionth       VR1ljMayciFxbnUokuQmJFw6QC9VKtub
```