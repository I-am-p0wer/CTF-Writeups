## Bandit_1

Bandit Level 1 → Level 2

Level Goal

The password for the next level is stored in a file called - located in the home directory

Commands you may need to solve this level

ls , cd , cat , file , du , find

Helpful Reading Material

Google Search for “dashed filename”
Advanced Bash-scripting Guide - Chapter 3 - Special Characters

## Solution

```bash
# ssh bandit1@bandit.labs.overthewire.org -p 2220
bandit1@bandit:~$ ls
-
bandit1@bandit:~$ file ./-
./-: ASCII text
bandit1@bandit:~$ cat ./-
PK8fYLZg2hnHSz83plBL1iEPKdD3QToB
```