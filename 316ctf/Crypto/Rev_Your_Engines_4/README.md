## Rev_Your_Engines_4

What is the first name of the person that said this?

Xlnnrgnvmg rh hgzbrmt gifv gl dszg blf hzrw blf dlfow wl olmt zugvi gsv nllw gszg blf hzrw rg rm szh ovug.

E.g., {Smith}

... seriously, watch the speech he gave in Dallas, Texas on YouTube.

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
Xlnnrgnvmg rh hgzbrmt gifv gl dszg blf hzrw blf dlfow wl olmt zugvi gsv nllw gszg blf hzrw rg rm szh ovug.

commitment is staying true to what you said you would do long after the mood that you said it in has left.
```

## Flag
```
{Inky}
```