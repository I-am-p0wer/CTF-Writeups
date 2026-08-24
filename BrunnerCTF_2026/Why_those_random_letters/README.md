## [35pt][CRYPTO][Beginner]Why_those_random_letters

We found this weird message, left behind the printer:

```
cqsWvloGoWfGsv|LXS4e`YEI4E5EmJuL`ExB2Fuuii`qSV5LoLeUpbnH"W~n
```
Like everything else in this business, it seems so random?

encrypt.pyが渡される。
```
import random
import string

plaintext_flag = "brunner{REDACTED}"


def encrypt_flag(plain_flag):
    letters = string.ascii_letters
    encrypted_flag = ""
    for char in plain_flag:
        random_letter_for_confusion = random.choice(letters)
        chars_to_add = chr(ord(char) + 1) + random_letter_for_confusion
        encrypted_flag += chars_to_add

    return encrypted_flag

print(encrypt_flag(plaintext_flag))
```


`brunner{REDACTED}`を暗号化するとこうなった。

```
cpsSvqogobfBse|hSRFLEfBKDRUVFtEe~i
```

`plaintext_flag`を変更してもう一度やってみる

```
plaintext_flag = "AAAAAAAAAA"
```

暗号化結果
```
BLBFBtBNBnBxBpBvBmBa
```

`string.ascii_letters`は、すべての英小文字(a-z)と英大文字(A-Z)を結合した文字列定数である。

```python
print(string.ascii_letters) 

#abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
```

奇数の部分はランダムなアルファベットが入るが無視できる。
偶数のところだけ文字を取り出して、ASCIIコードに変換、-1して文字に直す。

```Python
enc = 'cqsWvloGoWfGsv|LXS4e`YEI4E5EmJuL`ExB2Fuuii`qSV5LoLeUpbnH"W~n'

result = ''
for count, char in enumerate(enc):
    if count % 2 == 0:
        result += chr(ord(char) - 1)

print(result)
```

## Flag
```
brunner{W3_D34lt_w1th_R4ndom!}
```