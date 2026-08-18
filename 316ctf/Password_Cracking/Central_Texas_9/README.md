## [PasswordCracking]Central_Texas_9

`heidi:$6$X2DYru3MsQtttGKT$0rJKEdJjCA4XeOtxsE0mDZlby0R/jbgfy37VGNvu7w0gyA5sjHYhiO8huXLS8PfCg91r/mZFEnkttew//x90D0:19190:0:99999:7:::`
`
##  Solution

```Python 

from passlib.hash import sha512_crypt

#ターゲットハッシュ
#$6はSHA256
target = "heidi:$6$X2DYru3MsQtttGKT$0rJKEdJjCA4XeOtxsE0mDZlby0R/jbgfy37VGNvu7w0gyA5sjHYhiO8huXLS8PfCg91r/mZFEnkttew//x90D0:19190:0:99999:7:::"

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
{zymogen}
```