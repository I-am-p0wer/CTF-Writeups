## [PasswordCracking]Huntsville_3

$5$2gDmk0HP1lP31Ank$PrErZcHpY5GLh2UjXGMK5sD.4e5VzJ/6OORnb29PZf5

## Solution

solve.sh
```bash
target='$5$2gDmk0HP1lP31Ank$PrErZcHpY5GLh2UjXGMK5sD.4e5VzJ/6OORnb29PZf5'
while read -r pass; do
  if [ "$(mkpasswd -m sha-256 -S 2gDmk0HP1lP31Ank "$pass")" = "$target" ]; then
    echo "[+] Found: $pass"
    break
  fi
done <dictionary-list.txt
```

実行結果
```
localhost:~# ./solve.sh 
[+] Found: Bananaland
```
## Flag

```
{Bananaland}
```