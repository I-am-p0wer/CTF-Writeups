## [250pt]Between_The_Lines

An old poet left this manuscript on a dead drop server. Our forensic team says it looks like a normal poem. But something feels off about the spacing. Read carefully — not the words, but the gaps between them. Flagformt : 0xV0ID

## Solution

```Python
def decode_whitespace(filename):
    with open(filename, "rb") as f:
        lines = f.readlines()

    binary_str = ""
    for line in lines:
        # 改行コード（\r, \n）を除外した末尾の空白バイトを取得
        line = line.rstrip(b"\r\n")
        ws = bytearray()
        for b in reversed(line):
            if b in (0x20, 0x09):  # Space(0x20), Tab(0x09)
                ws.insert(0, b)
            else:
                break

        # スペース -> '0', タブ -> '1'
        binary_str += "".join("0" if b == 0x20 else "1" for b in ws)

    # 8ビット単位でASCIIコードに変換
    flag = ""
    for i in range(0, len(binary_str) - (len(binary_str) % 8), 8):
        byte_bits = binary_str[i : i + 8]
        flag += chr(int(byte_bits, 2))

    return flag

print(decode_whitespace("poem.txt"))
```

## Flag
```
0xV0ID{wh1t3sp4c3_h1d3s_4ll_truth}
```