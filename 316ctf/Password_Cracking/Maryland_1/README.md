## [PasswordCracking]DO_FIRST_FOR PASSWORD_CRACKING…_Maryland_#1

Unless stated otherwise, the cracked password is the flag for the Password Cracking challenges

Unless stated otherwise, use the attached wordlist to assist with cracking your passwords

I recommend learning how to use John the Ripper and Hashcat for the challenges you cannot simply Google search for.

Crack this hash. That is your flag.

c9af96c05921d8a3ad9d033367c0c873

E.g., {Password} Case-Sensitive!

## Solution

`dictionary-list.txt`から一行ずつ読み込み
MD5を計算し`c9af96c05921d8a3ad9d033367c0c873`と比較する。

```Python
import hashlib

hash = "c9af96c05921d8a3ad9d033367c0c873"

with open("dictionary-list.txt", "r") as f:
    for line in f:#一行ずつ読む
        word = line.strip()#改行等を削除
        md5_hash = hashlib.md5(word.encode("utf-8")).hexdigest()
        
        if md5_hash == hash:
            print(word)
            break

```

## Flag
```
{Abraham}
```
