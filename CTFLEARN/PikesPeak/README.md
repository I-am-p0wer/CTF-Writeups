## PikesPeak

20 points Easy

Pay attention to those strings!

## Solution 

```
# strings PikesPeak.jpg |head
```

```
# strings PikesPeak.jpg |head
JFIF
CTFLEARN{PikesPeak}
CTFLearn{Colorado}
%ctflearn{MountainMountainMountain}
#cTfLeArN{CTFMountainCTFmOUNTAIN}
CTF{AsPEN.Vail}
CTFlearn{Gandalf}
ctflearning{AUCKLAND}
ctfLEARN{MtDoom}
6ctflearninglearning{Mordor.TongariroAlpineCrossing}
```

複数あるのでgrep

```
# strings PikesPeak.jpg | grep "CTFlearn"
```

```
CTFlearn{Gandalf}
```


## Flag

```
CTFlearn{Gandalf}
```