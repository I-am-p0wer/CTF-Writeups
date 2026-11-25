## Undo

General Skills
Easy
by Yahaya Meddy

picoCTF 2026
Can you reverse a series of Linux text transformations to recover the original flag? Start searching for the flag here

nc chatelaine.cylabacademy.net 43243

## Solution

```
==Welcome to the Text Transformations Challenge!===

Your goal: step by step, recover the original flag.
At each step, you'll see the transformed flag and a hint.
Enter the correct Linux command to reverse the last transformation.

--- Step 1 ---
Current flag: KXFuMm40NjA4LWZhMDFnQHplMHNmYTRlRy1nazNnLXRhMWZlcmlyRShsenJxbnBu
Hint: Base64 encoded the string.
Enter the Linux command to reverse it:
```

```
base64 -d
```

```
--- Step 2 ---
Current flag: )qn2n4608-fa01g@ze0sfa4eG-gk3g-ta1ferirE(lzrqnpn
Hint: Reversed the text.
```

```
rev
```

```
--- Step 3 ---
Current flag: npnqrzl(Eriref1at-g3kg-Ge4afs0ez@g10af-8064n2nq)
Hint: Replaced underscores with dashes.
Enter the Linux command to reverse it:
```

```
 tr '-' '_'
```

```
--- Step 4 ---
Current flag: npnqrzl(Eriref1at_g3kg_Ge4afs0ez@g10af_8064n2nq)
Hint: Replaced curly braces with parentheses.
Enter the Linux command to reverse it: 
```

```
tr '()' '{}'
```

```
--- Step 5 ---
Current flag: npnqrzl{Eriref1at_g3kg_Ge4afs0ez@g10af_8064n2nq}
Hint: Applied ROT13 to letters.
Enter the Linux command to reverse it: 
```

```
tr 'a-zA-Z' 'n-za-mN-ZA-M'
```

```
Congratulations! You've recovered the original flag:
>>> academy{Revers1ng_t3xt_Tr4nsf0rm@t10ns_8064a2ad}
```

## Flag

```
academy{Revers1ng_t3xt_Tr4nsf0rm@t10ns_8064a2ad}
```
