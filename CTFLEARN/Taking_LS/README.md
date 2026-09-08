## Taking_LS

10 points Easy

Just take the Ls. Check out this zip file and I be the flag will remain hidden. https://mega.nz/#!mCgBjZgB!_FtmAm8s_mpsHr7KWv8GYUzhbThNn0I8cHMBi4fJQp8

## Solution

```bash
~/The Flag# ls -a
.             .DS_Store     The Flag.pdf
..            .ThePassword
~/The Flag# cat .ThePassword/ThePass
word.txt 
Nice Job!  The Password is "Im The Flag".
localhost:~/The Flag#
```

![flag](Waiting..../Ctflearn/Taking_LS/flag.jpg)

## Flag

```
ABCTF{T3Rm1n4l_is_COOl}
```