## [50pt]Confidence_Cipher

Confidence scores can look like telemetry, but they are the XOR key stream.

## Solution

confidence_log.csvか与えられる。

| Index | top_token | confidence_percent | cipher |
|---|---|---|---|
| 0 | tok00 | 53 | 5 |
| 1 | tok01 | 70 | 62 |
| 2 | tok02 | 87 | 1 |
| 3 | tok03 | 13 | 98 |
| 4 | tok04 | 30 | 119 |
| 5 | tok05 | 47 | 75 |
| 6 | tok06 | 64 | 59 |
| 7 | tok07 | 81 | 34 |
| 8 | tok08 | 7 | 102 |
| 9 | tok09 | 24 | 117 |
| 10 | tok10 | 41 | 89 |
| 11 | tok11 | 58 | 86 |
| 12 | tok12 | 75 | 34 |
| 13 | tok13 | 1 | 111 |
| 14 | tok14 | 18 | 117 |
| 15 | tok15 | 35 | 94 |

`confidence_percent`と`cipher`をペア同士でXORしてみる。

```
53^5 = 48 #chr(48) =`0`
```
Flagフォーマットの`0xV0ID{…}`と一致しそう。

```Python
Confidence_percent = [53, 70, 87, 13, 30, 47, 64, 81, 7, 24, 41, 58, 75, 1, 18, 35]

cipher = [5, 62, 1, 98, 119, 75, 59, 34, 102, 117, 89, 86, 34, 111, 117, 94]

result = ""
for i, k in zip(Confidence_percent, cipher):
    x = i ^ k
    result += chr(x)

print(result)
```

## Flag

```
0xVoid{sampling}
```