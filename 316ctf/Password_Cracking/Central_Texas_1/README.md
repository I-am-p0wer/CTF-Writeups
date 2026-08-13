## [PasswordCracking]Central_Texas_1

If `$5$` indicated SHA256-Crypt, what does `$6$` indicate?

Regardless, please crack brandon's password. That is the flag.

`brandon:$6$Q2ZhqUOflRhDWexT$Uyp.PFhwU9BxBu2JzeAZejL/exAaCVwt4ybCy/kkC5JTyt0WUIqBLnNXMMp5GhQ8acM/f3snkAqKMrOtPEh5R/:19190:0:99999:7:::`

## Solution

```Python 
from passlib.hash import sha512_crypt

#ターゲットハッシュ
#$6はSHA256
target = "brandon:$6$Q2ZhqUOflRhDWexT$Uyp.PFhwU9BxBu2JzeAZejL/exAaCVwt4ybCy/kkC5JTyt0WUIqBLnNXMMp5GhQ8acM/f3snkAqKMrOtPEh5R/:19190:0:99999:7:::"
#$6$Q2ZhqUOflRhDWexT...を取り出す
#print(target.split(':')[1])
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
{Burton-upon-Trent}
```