## [PasswordCracking]Central_Texas_3

`bob:$6$XY4vKfVBLCgrqk1.$RI2ynoHiR9qN5jkp.3fNUhhLUOz7Mbms7N3CG4wK/h0TC2ywPW3D4IzrdjZ2JlW00//N2b3lBk1IuP4g5.LmA/:19190:0:99999:7:::`

E.g., {Password}
##  Solution

```Python 
from passlib.hash import sha512_crypt

#ターゲットハッシュ
#$6はSHA256
target = "bob:$6$XY4vKfVBLCgrqk1.$RI2ynoHiR9qN5jkp.3fNUhhLUOz7Mbms7N3CG4wK/h0TC2ywPW3D4IzrdjZ2JlW00//N2b3lBk1IuP4g5.LmA/:19190:0:99999:7:::"
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
{Dallas}
```