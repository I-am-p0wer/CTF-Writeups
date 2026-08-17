## [250pt]Quiet_Note

FINAL SUBMISSION WARNING
This challenge allows only 1 flag attempt. Submit only when you are sure.
A small artifact is provided. Inspect it carefully and recover the single valid flag.

Flag format : 0xV01D{......}

Submit the complete flag exactly as shown by the format, including the prefix 0xV01D and the braces.

## Solution

letter.txt
```
0  The archive team left a calm sentence here.
x  The archive team left a calm sentence here.
V  The archive team left a calm sentence here.
0  The archive team left a calm sentence here.
1  The archive team left a calm sentence here.
…
```

最初の文字だけ抜き出す。
```python
flag =''
with open("letter.txt", "r", errors="ignore") as f:
    for line in f:
        word = line.strip()
        #print(word[:1])
        flag += word[:1]
        
print(flag)
```

##　Flag
```
0xV01D{FIRST_LETTERS_NEVER_LIE}
```