## Bandit_6

Bandit Level 6 → Level 7

Level Goal

The password for the next level is stored somewhere on the server and has all of the following properties:

owned by user bandit7
owned by group bandit6
33 bytes in size
Commands you may need to solve this level

ls , cd , cat , file , du , find , grep


## Solution

```bash
bandit6@bandit:~$ find / -size 33c -user bandit7 -group bandit6 -type f 2>/dev/null

/var/lib/dpkg/info/bandit7.password

bandit6@bandit:~$ cd /var/lib/dpkg/info/

bandit6@bandit:/var/lib/dpkg/info$ cat bandit7.password

Bmnnvf82KzQlfxgAI2d1zYbr1u9pr3E3
```
