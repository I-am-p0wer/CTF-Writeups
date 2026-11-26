## Simple_Programming

30 points Easy

Can you help me? I need to know how many lines there are where the number of 0's is a multiple of 3 or the numbers of 1s is a multiple of 2. Please! Here is the file: https://mega.nz/#!7aoVEKhK!BAohJ0tfnP7bISIkbADK3qe1yNEkzjHXLKoJoKmqLys

## Solution 

Pythonで書いた

```Python
linecount = 0
with open("data.dat", "r", errors="ignore") as f:
 	 for line in f:
 	 	 num = line.strip()
 	 	 zero = num.count("0")
 	 	 one = num.count("1")
 	 	 if zero % 3 == 0 or one % 2 == 0: 
 	 	  	linecount += 1
 	 	  
print(linecount) 
```

```
6662
```

## Flag


```
CTFlearn{6662}
```