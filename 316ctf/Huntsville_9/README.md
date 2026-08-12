## [PasswordCracking]Huntsville_9

$5$.BkhQJaGU9sNJilG$GuJYSE.zICBm4XU12RAICpRtC5IKj8Y2vm0WUSrWWw5

## Solution

solve.sh
```bash
target='$5$.BkhQJaGU9sNJilG$GuJYSE.zICBm4XU12RAICpRtC5IKj8Y2vm0WUSrWWw5'
while read -r pass; do
  if [ "$(mkpasswd -m sha-256 -S .BkhQJaGU9sNJilG "$pass")" = "$target" ]; then
    echo "[+] Found: $pass"
    break
  fi
done <dictionary-list.txt
```

実行結果
```
localhost:~# ./solve.sh 
[+] Found: zip-fasteners
```
## Flag

```
{zip-fasteners}
```