## NUM83R5_2

What is the last name of the person that said this?

23 8 5 14 25 15 21 23 1 14 20 20 15 19 21 3 3 5 5 4 1 19 2 1 4 1 19 25 15 21 23 1 14 20 20 15 2 18 5 1 20 8 5 20 8 5 14 25 15 21 12 12 2 5 19 21 3 3 5 19 19 6 21 12

E.g., {Smith}

... you're going to watch this speech, right? ;)

## Solution

```Python

num = '23 8 5 14 25 15 21 23 1 14 20 20 15 19 21 3 3 5 5 4 1 19 2 1 4 1 19 25 15 21 23 1 14 20 20 15 2 18 5 1 20 8 5 20 8 5 14 25 15 21 12 12 2 5 19 21 3 3 5 19 19 6 21 12'.split(' ')
alp ='abcdefghijklmnopqrstuvwxyz'

result =''
for i in num:
	#配列は0から始まるので-1する
	result += str(alp[int(i)-1])
	
print(result)
```

Result
```
whenyouwanttosucceedasbadasyouwanttobreathethenyoullbesuccessful
```

## Flag

```
Thomas
```