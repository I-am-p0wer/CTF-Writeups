## Bandit_12

Bandit Level 12 → Level 13

Level Goal

The password for the next level is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under /tmp in which you can work. Use mkdir with a hard to guess directory name. Or better, use the command “mktemp -d”. Then copy the datafile using cp, and rename it using mv (read the manpages!)

Commands you may need to solve this level

grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd, mkdir, cp, mv, file

```bash
bandit12@bandit:~$ ls
data.txt

bandit12@bandit:~$ file data.txt 
data.txt: ASCII text

#一時フォルダ作成
bandit12@bandit:~$ mktemp -d
/tmp/tmp.FHq3kAjdBB

#data.txtをコピー
bandit12@bandit:~$ cp data.txt /tmp/tmp.FHq3kAjdBB

bandit12@bandit:~$ cd  /tmp/tmp.FHq3kAjdBB

# xxd -r 16進ダンプを元ファイルに復元
bandit12@bandit:/tmp/tmp.FHq3kAjdBB$ xxd -r data.txt > data

bandit12@bandit:/tmp/tmp.FHq3kAjdBB$ file data

data: gzip compressed data, was "data2.bin", last modified: Wed Jun 24 14:58:46 2026, max compression, from Unix, original size modulo 2^32 580

andit12@bandit:/tmp/tmp.FHq3kAjdBB$ mv data data.gz

#gzip解凍
bandit12@bandit:/tmp/tmp.FHq3kAjdBB$ gzip -d data.gz 

bandit12@bandit:/tmp/tmp.FHq3kAjdBB$ ls
data  data.txt

bandit12@bandit:/tmp/tmp.FHq3kAjdBB$ file data
data: bzip2 compressed data, block size = 90

#bzip2解凍
bandit12@bandit:/tmp/tmp.FHq3kAjdBB$ bzip2 -d data
bzip2: Cant guess original name for data -- using data.out

bandit12@bandit:/tmp/tmp.FHq3kAjdBB$ ls
data.out  data.txt

bandit12@bandit:/tmp/tmp.FHq3kAjdBB$ file data.out 
data.out: gzip compressed data, was "data4.bin", last modified: Wed Jun 24 14:58:46 2026, max compression, from Unix, original size modulo 2^32 20480

andit12@bandit:/tmp/tmp.FHq3kAjdBB$ cat data8 
The password is qQYQiHOBPR8zR61qxYqX45quvihF2uzk
```