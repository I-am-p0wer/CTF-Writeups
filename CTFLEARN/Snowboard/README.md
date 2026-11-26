## Snowboard

20 points Easy

Find the flag in the jpeg file. Good Luck!

## Solution

```
# strings Snowboard.jpg | grep "fla
g"

```

```
CTFlearn{CTFIsEasy!!!}
```

楽勝だと思ったらFlagが違うと言われた
もう一度stringsしてみる。

```
# strings Snowboard.jpg |head
```

```
JFIF
CTFlearn{CTFIsEasy!!!}
Q1RGbGVhcm57U2tpQmFuZmZ9Cg==
Exif
Canon
Canon EOS 6D Mark II
GIMP 2.10.6
2019:05:07 14:37:21
0230
2018:08:23 12:52:08
```

Base64文字列が書いてある。

```
Q1RGbGVhcm57U2tpQmFuZmZ9Cg==
```

復号する

```
CTFlearn{SkiBanff}
```

## Flag

```
CTFlearn{SkiBanff}
```