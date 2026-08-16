## [25pt]Negative_Prompt_Masterpiece

The model generated a beautiful image and insisted the secret was removed from the prompt


## Solution

```shell
localhost:~# strings masterpiece.png 
IHDR
tEXtSoftware
questionable-ctf-v1_?
KtEXtPrompt
A confident robot painting a flag-shaped cloud, no secrets included.
]tEXtNegativePrompt
no plaintext, no spoilers, definitely no 0xVoid{negative_prompt_positive_flag}
IDATx
#/; A
/; A
; a?
IEND
localhost:~#
```

## Flag
```
0xVoid{negative_prompt_positive_flag}
```