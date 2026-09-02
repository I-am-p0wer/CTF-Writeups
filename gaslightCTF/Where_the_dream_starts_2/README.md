## Where_the_dream_starts_2

Musicians transpose keys regularly. Cryptanalysts transpose columns[https://en.wikipedia.org/wiki/Transposition_cipher#Columnar_transposition].  regularly.

Keylength: key of cipher in Where the dream starts 1
Keyword: ascii_lowercase[:keylength]

## Solution

　暗号文は57文字。これを列数3行数19（57 \div 3 = 19）19文字ずつ3列に分ける。

 1列目 (0〜18文字目): ⁠T aiglhTtn0-t-yf-4}⁠
 2列目 (19〜37文字目): ⁠hfgsaitFrss2hk--fte⁠
 3列目 (38〜56文字目): ⁠el  sgC{4p3-330gl!o⁠


行 | 1列目 | 2列目 | 3列目 | 復元テキスト
---|-------|-------|-------|--------------
01 |   T   |   h   |   e   | The
02 |  ' '  |   f   |   l   |  fl
03 |   a   |   g   |  ' '  | ag 
04 |   i   |   s   |  ' '  | is 
05 |   g   |   a   |   s   | gas
06 |   l   |   i   |   g   | lig
07 |   h   |   t   |   C   | htC
08 |   T   |   F   |   {   | TF{
09 |   t   |   r   |   4   | tr4
10 |   n   |   s   |   p   | nsp
11 |   0   |   s   |   3   | 0s3
12 |   -   |   2   |   -   | -2-
13 |   t   |   h   |   3   | th3
14 |   -   |   k   |   3   | -k3
15 |   y   |   -   |   0   | y-0
16 |   f   |   -   |   g   | f-g
17 |   -   |   f   |   l   | -fl
18 |   4   |   t   |   !   | 4t!
19 |   }   |   e   |   o   | }eo (末尾eoはパディング)


```python
ciphertext = "T aiglhTtn0-t-yf-4}hfgsaitFrss2hk--fteel  sgC{4p3-330gl!o"

len = len(ciphertext)  # 57文字
cols = 3 # 3列
rows = len // cols # 19行

col1 = ciphertext[0:19]   #0-18
col2 = ciphertext[19:38]  #19-37
col3 = ciphertext[38:57]  #38-57

#1文字ずつ並べ直す
plaintext_chars = []
for i in range(rows):
    plaintext_chars.append(col1[i])
    plaintext_chars.append(col2[i])
    plaintext_chars.append(col3[i])

plaintext = "".join(plaintext_chars)
print(plaintext)
```
### Result

```
The flag is gaslightCTF{tr4nsp0s3-2-th3-k3y-0f-g-fl4t!}eo
```

## Flag

```
gaslightCTF{tr4nsp0s3-2-th3-k3y-0f-g-fl4t!}
```