## Bandit_2

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
bandit2@bandit:~$ ls
--spaces in this filename--
bandit2@bandit:~$ cat ./--spaces\ in\ this\ filename--
7ZZ2LFrykP2zEyvBl4m3clcL7tGYJPME
```