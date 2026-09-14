## Dont_Bump_Your_Head_er_

40 points Medium

Try to bypass my security measure on this site! http://165.227.106.113/header.php

## Solution

```
# curl -A "Sup3rS3cr3tAg3nt" http:/
/165.227.106.113/header.php
```

```
Sorry, it seems as if you did not just come from the site, "awesomesauce.com".
<!-- Sup3rS3cr3tAg3nt  -->
```

```
localhost:~# curl -H "User-Agent: Sup3rS3cr3tAg3nt" -e "awesomesauce.com" http://165.227.106.113/header.php
```

```
Here is your flag: flag{did_this_m3ss_with_y0ur_h34d}
```


## Flag

```
flag{did_this_m3ss_with_y0ur_h34d}
```
