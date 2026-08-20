## NUM83R5_1

20 8 5 6 12 1 7 20 15 20 8 9 19 3 8 1 12 12 5 14 7 5 9 19 26 5 2 18 1

E.g., {somestring}

##　Solution

```Python 
num = '20 8 5 6 12 1 7 20 15 20 8 9 19 3 8 1 12 12 5 14 7 5 9 19 26 5 2 18 1'.split(' ')
alp ='abcdefghijklmnopqrstuvwxyz'

result =''
for i in num:
	#配列は0から始まるので-1する
	result += str(alp[int(i)-1])
	
print(result)
```
## Result

```
theflagtothischallengeiszebra
```

## Flag
```
{zebra}
```