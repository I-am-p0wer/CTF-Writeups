## [PasswordCracking]Central_Texas_5

`dave:$6$.Lru2yqSghdi2O6T$/aSELVnifnAkWJdNsnsKoSp8/oj2eD9yqA/C4S1nCagSfS/Oq/SpoULVn26n2w00uZ6nv4qHGSPhAiwCnEXqn0:19190:0:99999:7:::`

##  Solution

```Python 

from passlib.hash import sha512_crypt

#ターゲットハッシュ
#$6はSHA256
target = "dave:$6$.Lru2yqSghdi2O6T$/aSELVnifnAkWJdNsnsKoSp8/oj2eD9yqA/C4S1nCagSfS/Oq/SpoULVn26n2w00uZ6nv4qHGSPhAiwCnEXqn0:19190:0:99999:7:::"

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
{zucchettos}
```