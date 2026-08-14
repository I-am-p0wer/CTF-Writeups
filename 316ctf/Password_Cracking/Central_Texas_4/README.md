## [PasswordCracking]Central_Texas_4

`charlie:$6$yUSfQ8DDjUYWHjxa$qyYKwkQ3RyDQvZgtxXwmsMGfpA4r5vQy8SEt26YDkpyCkiTxbB5YFp.u2xCbsnjEK65pHxJYh6XdRpW9kI65W1:19190:0:99999:7:::`

##  Solution

```Python 

from passlib.hash import sha512_crypt

#ターゲットハッシュ
#$6はSHA256
target = "charlie:$6$yUSfQ8DDjUYWHjxa$qyYKwkQ3RyDQvZgtxXwmsMGfpA4r5vQy8SEt26YDkpyCkiTxbB5YFp.u2xCbsnjEK65pHxJYh6XdRpW9kI65W1:19190:0:99999:7:::"
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
{Frankfurt}
```