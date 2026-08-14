## [Rev][Medium]Read_Assembly

アセンブリを読もう！

フラグは Alpaca{challenge関数の返り値} として送信してください。

asm.txt
```asm

0000000000000840 <challenge>:
 840:   52800000        mov     w0, #0x0                        // #0
 844:   52800001        mov     w1, #0x0                        // #0
 848:   52800024        mov     w4, #0x1                        // #1
 84c:   52800002        mov     w2, #0x0                        // #0
 850:   14000005        b       864 <challenge+0x24>
 854:   0b030000        add     w0, w0, w3
 858:   11000421        add     w1, w1, #0x1
 85c:   2a0203e4        mov     w4, w2
 860:   2a0303e2        mov     w2, w3
 864:   0b040043        add     w3, w2, w4
 868:   3607ff61        tbz     w1, #0, 854 <challenge+0x14>
 86c:   11000421        add     w1, w1, #0x1
 870:   7100a03f        cmp     w1, #0x28
 874:   54ffff41        b.ne    85c <challenge+0x1c>  // b.any
 878:   d65f03c0        ret
```

## Solution

Pythonに置き換えると次のようになった。
```Python
w0 = 0  # 840:mov w0, #0x0
w1 = 0  # 844:mov w1, #0x0
w4 = 1  # 848:mov w4, #0x1
w2 = 0  # 84c:mov w2, #0x0

# 850 b 864

while True:
    w3 = w2 + w4  # 864:add w3, w2, w4
    if (w1 & 1) == 0:  # 868:tbz w1, #0, 854
        w0 += w3  # 854:add w0, w0, w3
    w1 += 1  # 858:w1, w1, #0x1

    if w1 == 0x28:  # 870: cmp w1,#0x28
        # 874 b.ne 85c
        break  # 878 ret

    w4 = w2  # 85c:mov w4, w2
    w2 = w3  # 860:mov w2, w3

print(w0)
```

実行結果
```
102334155
```
## Flag

```
Alpaca{102334155}
```

