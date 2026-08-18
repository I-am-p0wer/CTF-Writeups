## [PasswordCracking]Central_Texas_7

`frank:$6$Lh96d9tzSvEQmiFa$QrgyEoIA2xUeEz3oXBCV.2OINz5l4BQ0IWsUR1C9K1usczzdOUlhSC9fMl/PciCTOWRK7VfE3bS8nnbKDGzuz0:19190:0:99999:7:::`
``
##  Solution

```Python 

from passlib.hash import sha512_crypt

#ターゲットハッシュ
#$6はSHA256
target = "frank:$6$Lh96d9tzSvEQmiFa$QrgyEoIA2xUeEz3oXBCV.2OINz5l4BQ0IWsUR1C9K1usczzdOUlhSC9fMl/PciCTOWRK7VfE3bS8nnbKDGzuz0:19190:0:99999:7:::"

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
{zugzwang}
```