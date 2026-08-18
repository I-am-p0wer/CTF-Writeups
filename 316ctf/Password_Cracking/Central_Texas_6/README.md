## [PasswordCracking]Central_Texas_6

`eve:$6$VOjYUME6y1981c/l$fWZazhXap7a9JOXYdyKW6XolVZ3sgDeF2RMYhbXuaWZKf1szfo.sh98Kh4DSaSH7jGuwg2CseD/7XhOMK6xsZ/:19190:0:99999:7:::`
``
##  Solution

```Python 

from passlib.hash import sha512_crypt

#ターゲットハッシュ
#$6はSHA256
target = "eve:$6$VOjYUME6y1981c/l$fWZazhXap7a9JOXYdyKW6XolVZ3sgDeF2RMYhbXuaWZKf1szfo.sh98Kh4DSaSH7jGuwg2CseD/7XhOMK6xsZ/:19190:0:99999:7:::"

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
{zucchini}
```