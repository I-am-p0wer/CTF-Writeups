## [PasswordCracking]Central_Texas_8

`grace:$6$bdQQQRbN8mYzmEdF$uaJHzhtY4fMigc0jr8VK5cQU3/lVyCQB367vvabG29VQRmdoaRCEcikqxjco4ivRpMPMn89AFptAXqHzBoj3F/:19190:0:99999:7:::`
`
##  Solution

```Python 

from passlib.hash import sha512_crypt

#ターゲットハッシュ
#$6はSHA256
target = "grace:$6$bdQQQRbN8mYzmEdF$uaJHzhtY4fMigc0jr8VK5cQU3/lVyCQB367vvabG29VQRmdoaRCEcikqxjco4ivRpMPMn89AFptAXqHzBoj3F/:19190:0:99999:7:::"

target_hash = target.split(":")[1]


with open("dictionary-list.txt", "r") as f:
    for line in f:
        word = line.strip()
        if sha512_crypt.verify(word, target_hash):
            print(word)
            break
```

## Flag

```
{zygocactus}
```