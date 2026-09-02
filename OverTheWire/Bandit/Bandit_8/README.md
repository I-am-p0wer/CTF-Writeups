## Bandit_8

Bandit Level 8 → Level 9

Level Goal

The password for the next level is stored in the file data.txt and is the only line of text that occurs only once

Commands you may need to solve this level

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

## Solution

```
bandit8@bandit:~$ sort data.txt | uniq -u

EjmOSvuAu7sGAHqHVcBDPirRe9T03kxl

```