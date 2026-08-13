## [PasswordCracking]Huntsville_6

$5$ns6Dcq0gqpa5GkuT$BHDqqiXz7Ul43/AoIUAwAcNhc4ndZhQjV/EBUwRnkcD

## Solution

solve.sh
```bash
target='$5$ns6Dcq0gqpa5GkuT$BHDqqiXz7Ul43/AoIUAwAcNhc4ndZhQjV/EBUwRnkcD'
while read -r pass; do
  if [ "$(mkpasswd -m sha-256 -S ns6Dcq0gqpa5GkuT "$pass")" = "$target" ]; then
    echo "[+] Found: $pass"
    break
  fi
done <dictionary-list.txt
```

実行結果
```
localhost:~# ./solve.sh 
[+] Found: Sno-Cats
```
## Flag

```
{Sno-Cats}
```