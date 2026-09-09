## 07601

60 points Medium

https://mega.nz/#!CXYXBQAK!6eLJSXvAfGnemqWpNbLQtOHBvtkCzA7-zycVjhHPYQQ I think I lost my flag in there. Hopefully, it won't get attacked...

## Solution 

オンラインBinwalktoolを使った。

https://www.unroll.ing/ja/

抽出し解凍する
```
Secret Stuff.../Don't Open This.../I Warned You.jpeg
```
が生成される。

![](picture.jpg)

画像ファイルのようだが開けなかったのでstringsしてみるとFlagがあった。

```
strings I\ Warned\ You.jpeg 
```

```
# strings I\ Warned\ You.jpeg 
JFIF
2ABR
#abr
12RAB

....

11,LHV
ABCTF{Du$t1nS_D0jo}1r
z:af
fQ4s>#t\s
WofP

...

```

## Flag

```
ABCTF{Du$t1nS_D0jo}
```