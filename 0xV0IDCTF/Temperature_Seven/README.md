## [50pt]Temperature_Seven

The model encrypted the flag with temperature 0.7, which is not how cryptography works.

0.7ではなく0x7でXORする。

## Solution

```python
cipher = [55,127,81,104,110,99,124,115,98,106,119,98,117,102,115,114,117,98,88,110,116,88,105,104,115,88,102,88,116,98,100,117,98,115,122]

p = ''
for i in cipher:
	p += chr(i ^ 0x7)
print(p)
```

## Flag
```
0xVoid{temperature_is_not_a_secret}
```