## Character_Encoding

20 points Easy

In the computing industry, standards are established to facilitate information interchanges among American coders. Unfortunately, I've made communication a little bit more difficult. Can you figure this one out? 41 42 43 54 46 7B 34 35 43 31 31 5F 31 35 5F 55 35 33 46 55 4C 7D

## Solution

```Python 
cipher ='41 42 43 54 46 7B 34 35 43 31 31 5F 31 35 5F 55 35 33 46 55 4C 7D'

cipher = cipher.split()
result =''
for i in cipher:
	result += chr(int(i,16))
	
print(result)
```

## Flag

```
ABCTF{45C11_15_U53FUL}
```