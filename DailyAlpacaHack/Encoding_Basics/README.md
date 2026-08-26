## [Misc][Crypto][Easy]Encoding_Basics

CTFのCryptoでよく使われるencode方法を学びましょう！

## Solution

chall.py 

フラグをバイトに変換し3つに分割して格納している。
```python
flag = os.getenv("FLAG", "DUMMYD{DUMMYDUMMYDUMMYDUMMYDUMMYDUMMYDUMMYDUMMYDUMMYDUMMYDUMMY}").encode() 
flag1 = flag[:20]
flag2 = flag[20:40]
flag3 = flag[40:]
```

| 変数| コード | 位置 | 抽出されるデータ|
| :--- | :--- | :--- | :--- |
| flag1 | flag[:20] | 0 から 19 まで | 20 文字（バイト） |
| flag2 | flag[20:40] | 20 から 39 まで | 20 文字（バイト） |
| flag3 | flag[40:] | 40 から 末尾 まで | 残りすべて |




各flagの暗号化は以下の通り。
```Python
#flag1 整数に変換
print(f"long_value = {bytes_to_long(flag1)}") 

#flag2 16進数文字列に変換
print(f'hex_string = "{flag2.hex()}"')

#flag3 Base64にエンコード
print(f'base64_string = "{base64.b64encode(flag3).decode()}"')
```

逆手順で復号していく。

各フラグの変換と逆変換の対応は以下。

| 変数| 出力時 | 逆変換 |
| :--- | :--- | :--- |
| flag1 | bytes_to_long() | long_to_bytes() |
| flag2 | hex() | bytes.fromhex() |
| flag3 | base64.b64encode() | base64.b64decode() |

逆変換するスクリプトを書く。

```Python
from Crypto.Util.number import *
import base64
import os

long_value = 373502670300504551747111047082539140193958649718
hex_string = "346c5f6833785f6630726d61745f31735f636c33"
base64_string = "NG5fYjY0X3A0ZGQxbmdfaXNfY29vbH0="

long = long_to_bytes(long_value).decode()
hex = bytes.fromhex(hex_string).decode()
base = base64.b64decode(base64_string).decode()

flag = long + hex + base

print(flag)
#Alpaca{b1g_1nt3ger_v4l_h3x_f0rmat_1s_cl34n_b64_p4dd1ng_is_cool}
```

## Flag

```
Alpaca{b1g_1nt3ger_v4l_h3x_f0rmat_1s_cl34n_b64_p4dd1ng_is_cool}
```

"Big integer value, hex format is clean, b64 padding is cool."