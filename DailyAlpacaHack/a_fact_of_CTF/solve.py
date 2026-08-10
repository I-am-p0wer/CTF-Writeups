with open("output.txt", "r") as f:
    cipher = f.read()
    #print(type(cipher))
    # <class 'str'>
    #print(cipher)
    # 0xadb88e47d531cdb104013....
    
cipher = int(cipher,16)

primes  = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293]

flag = ""

for i in primes:
	if cipher % i == 0:
		count = 0
		while cipher % i == 0:
			cipher= cipher // i
			count = count + 1
			#print(count)
		flag = flag + chr(count)
		
print(flag)