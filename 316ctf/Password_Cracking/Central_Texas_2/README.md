## [PasswordCracking]Central_Texas_2

Ensure you know, by now, what each field of the /etc/shadow line below indicates.

[https://linuxize.com/post/etc-shadow-file/](https://linuxize.com/post/etc-shadow-file/)

Anyways, what is alice's password? That is the flag.

`alice:$6$yy0vXVKc0f6qKzwh$bzF9LLevBnOzPTeU0keuU/ODInMli8vLEOqiSesUzbJ2eiqrJ9PTJCCPACCOl8r.b3ON2Ex9XUWiPL2ugfemj/:19408:0:99999:7:::`

## Solution

```python
from passlib.hash import sha512_crypt

#ターゲットハッシュ
#$6はSHA256
target = "alice:$6$yy0vXVKc0f6qKzwh$bzF9LLevBnOzPTeU0keuU/ODInMli8vLEOqiSesUzbJ2eiqrJ9PTJCCPACCOl8r.b3ON2Ex9XUWiPL2ugfemj/:19408:0:99999:7:::"
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
{Caernarvonshire}
```