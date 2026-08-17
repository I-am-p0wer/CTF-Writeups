## [50pt]Tokenizer_Off_By_One

A synthetic tokenizer was exported for humans. That was the bug.

## Solution

```Python
vocab_zero_indexed = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '_', '{', '}']
 
generated_token_ids =[1, 60, 32, 51, 45, 40, 64, 44, 57, 49, 37, 50, 55, 63, 55, 56, 37, 54, 56, 63, 37, 56, 63, 51, 50, 41, 63, 49, 51, 40, 41, 48, 55, 63, 40, 51, 63, 50, 51, 56, 65]

result = ''
for i in generated_token_ids:
	result += vocab_zero_indexed[i-1]

print(result)
```
## Flag

```
0xVoid{humans_start_at_one_models_do_not}
```