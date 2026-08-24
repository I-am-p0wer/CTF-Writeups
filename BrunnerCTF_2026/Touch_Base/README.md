## [20pt][ENCODING][Beginner]Touch_Base

Management has published a new mandate proclaiming that all communication must now use the updated encoding protocol for touching base.

The most recent message recieved was the following string: YnJ1bm5lcnt0MHVjaDFuZ19iNHMzNjRfMTVfaDMxMTRfYjQ1M2QhfQ==

I heard rumours from my colleagues about some sort of CyberChef being the new Head of Communications behind the new mandate.

## Solution

Base64でデコードする。
```Python
import base64

print(base64.b64decode(('YnJ1bm5lcnt0MHVjaDFuZ19iNHMzNjRfMTVfaDMxMTRfYjQ1M2QhfQ==')))
```

## Flag
```
brunner{t0uch1ng_b4s364_15_h3114_b453d!}
```