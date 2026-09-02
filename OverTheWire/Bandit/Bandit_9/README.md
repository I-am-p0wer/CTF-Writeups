## Bandit_9

Bandit Level 9 → Level 10

Level Goal

The password for the next level is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters.

Commands you may need to solve this level

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd

## Solution

```bash
bandit9@bandit:~$ strings data.txt | grep "="
========== the
[==p+
=zW}
========== password
Y========== is
k8c=
yo=-
=A@.
.=O],
=l"C"m
j=9$
========== B0s2khmbT9u0geKuOoVGW3JZKhndE3BG
'=5G
```