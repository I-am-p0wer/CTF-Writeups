## [20pt][FORENSICS][Beginner]Bears

Per new synergy guidelines, all confidential beet logistics are now embedded directly into visual brand assets. Please extract your action items from the attached mascot photo.

![bear](bear.png)

## Solution

```bash
localhost:~# strings bear.png
IHDR
 tEXtComment
brunner{b34rs_347_b337s}0c
IDATx
?XJ"
```

## Flag

```
brunner{b34rs_347_b337s}
```