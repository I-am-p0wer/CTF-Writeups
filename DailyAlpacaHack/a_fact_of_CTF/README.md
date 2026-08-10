## [Crypto][Easy]a_fact_of_CTF

AlpacaHack で一番最初に完成したものの難易度調整により出題されなかった幻の問題 （運営コメント）

## Solution

`not_a_flag`の部分を変更することで、任意の文字列を暗号化できる。

```
flag = os.environ.get("FLAG", "not_a_flag")
```

暗号化はこの部分で行われる。
```Python
ct = 1
for i, c in enumerate(flag):
    ct *= primes[i] ** (ord(c))
print(hex(ct))
```

`A`を暗号化してみる
```Python
0x20000000000000000
```

これは
```
hex(2 ** 65)
```
と等しい

次に`AB`を暗号化してみる
```Python
0x30c1af458168586c7e08ae94a120000000000000000

```

これは
```
hex(2 ** 65 * 3 ** 66)
```
と等しい

文字コードはそれぞれ
```Python
chr(65) #A
Chr(66) #B
```

出力された内容は素数をflagの文字列を整数に変換したもので累乗したものであることが分かった。よって、素因数分解をして元の文字列を求めるコードを書く。

```Python
with open("output.txt", "r") as f:
    cipher = f.read()
    #print(type(cipher))
    # <class 'str'>
    #print(cipher)
    # 0xadb88e47d531cdb104013....
    
cipher = int(cipher,16)

primes  = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293]

flag = ""

for i in primes:
	if cipher % i == 0:
		count = 0
		while cipher % i == 0:
			cipher= cipher // i
			count = count + 1
			#print(count)
		flag = flag + chr(count)
		
print(flag)
```

## Flag

```
Alpaca{prime_factorization_solves_everything}
```