## Bandit_5

Bandit Level 5 → Level 6

Level Goal

The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:

human-readable
1033 bytes in size
not executable
Commands you may need to solve this level

ls , cd , cat , file , du , find

## Solution

```bash
bandit5@bandit:~$ ls
inhere

bandit5@bandit:~$ cd inhere/

bandit5@bandit:~/inhere$ ls
maybehere00  maybehere07  maybehere14
maybehere01  maybehere08  maybehere15
maybehere02  maybehere09  maybehere16
maybehere03  maybehere10  maybehere17
maybehere04  maybehere11  maybehere18
maybehere05  maybehere12  maybehere19
maybehere06  maybehere13

bandit5@bandit:~/inhere$ find -size 1033c
./maybehere07/.file2

bandit5@bandit:~/inhere$ cd maybehere07/

bandit5@bandit:~/inhere/maybehere07$ ls
-file1  -file3        spaces file2
-file2  spaces file1  spaces file3

bandit5@bandit:~/inhere/maybehere07$ cat .file2 
pXa26xhMWaC2SvDotA4r9EgZkulOeSBW
```