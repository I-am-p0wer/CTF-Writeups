## Bandit_17

Bandit Level 17 → Level 18

Level Goal

There are 2 files in the homedirectory: **passwords.old and passwords.new**. The password for the next level is in**passwords.new** and is the only line that has been changed between **passwords.old and passwords.new**

**NOTE: if you have solved this level and see ‘Byebye!’ when trying to log into bandit18, this is related to the next level, bandit19**

Commands you may need to solve this level

cat, grep, ls, diff

## Solution

Password
```
pWXMAZoxGC8JmDMfmT5MGEsobMM3vnj2
```

```
bandit17@bandit:~$ diff passwords.new passwords.old 
42c42
< OQxXZjELndr90zuhOTDYBEomI0SZITXI
---
> qOg5pVOjPx9x9VccyYBADiT4xxyoUB8D
```

```
bandit17@bandit:~$ diff passwords.old password
s.new
42c42
< qOg5pVOjPx9x9VccyYBADiT4xxyoUB8D
---
> OQxXZjELndr90zuhOTDYBEomI0SZITXI
```

```
OQxXZjELndr90zuhOTDYBEomI0SZITXI
````