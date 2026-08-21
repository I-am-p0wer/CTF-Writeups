## Rev_Your_Engines_3

Decode this message. What does this quote state people feel your what?

Kvlkov nzb svzi blfi dliwh, yfg gsvb uvvo blfi zggrgfwv. - Qlsm X. Nzcdvoo

E.g., {heart}

## Solution

アトバシュ暗号（Atbash Cipher）

A > Z

B > Y

C > X

記号はそのまま残す。

```python 

ABC = 'abcdefghijklmnopqrstuvwxyz .-,'
ZYX = 'zyxwvutsrqponmlkjihgfedcba .,-'

#全部小文字にする
input = input('> ').lower() 

for i in input:
    if i in ABC:
        index = ABC.index(i)
        print(ZYX[index], end='')
```

実行結果
```
> Kvlkov nzb svzi blfi dliwh, yfg gsvb uvvo blfi zggrgfwv. - Qlsm X. Nzcdvoo
people may hear your words- but they feel your attitude. , john c. maxwell
```

## Flag
```
{attitude}
```