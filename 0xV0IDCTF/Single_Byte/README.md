## [250pt]Single_Byte

FINAL SUBMISSION WARNING
This challenge allows only 2 flag attempt. Submit only when you are sure.
A binary blob was extracted from RAM. It's not plaintext — but it's close.

Single-byte operations are often reversible. Try all 256 possibilities.

Flag format : 0xV0ID{......}

## Solution

CyberChefで解く。
```
[INPUT]
3a727214060b3a393072291d3b71241d3772262c003f

[Recipe]
From Hex → XOR Brute Force
```
```
Key = 42: x00VDIx{r0k_y3f_u0dnB}
```
42の時がFLAGっぽい。文字を入れ替え正しいFlag形式に直す。

## Flag
```
0xV0ID{x0r_k3y_f0und}
```