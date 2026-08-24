## [25pt][ENCODING][Beginner]Going_Paperless

Brunnerne Inc.™ is going paperless to reduce its environmental impact - upper management heard this makes the company look better to the shareholders.

So from now on, all documents must instead be typed on computer - before then being printed and filed in the physical archive because the senior managers consider digital storage "highly experimental".

I'm pretty sure there's a problem with our printer settings though, it's converting everything to numbers before printing - take a look:

98 114 117 110 110 101 114 123 97 115 99 105 105 95 103 114 101 101 110 119 97 115 104 105 110 103 125

I guess it makes sense, digital devices cannot actually store letters, punctuation, and other characters directly - only as numbers, stored in binary. So they need a way of converting a character to a number - this is called an encoding.

The output looks a bit like ASCII to me, one of the oldest and most used encodings for some of the most common characters. Take a look at the ASCII table below and see if you can see what was printed:


![](ASCII.png)

##  Solution

ASCIIコードを文字に変換して結合

```Python
cipher = '98 114 117 110 110 101 114 123 97 115 99 105 105 95 103 114 101 101 110 119 97 115 104 105 110 103 125'

result = ''
for i in cipher.split():
	result += chr(int(i))

print(result)
```

## Flag
```
brunner{ascii_greenwashing}
```