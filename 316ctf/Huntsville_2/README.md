## [PasswordCracking]Huntsville_2

$5$GWFRZdN0poiDsDa2$Ye0qAoEAU4CTL7z5aKqLe9KzjDDXNccElKghB7ljJp.

## Solution

solve.sh
```bash
target='$5$GWFRZdN0poiDsDa2$Ye0qAoEAU4CTL7z5aKqLe9KzjDDXNccElKghB7ljJp.'
while read -r pass; do
  if [ "$(mkpasswd -m sha-256 -S GWFRZdN0poiDsDa2 "$pass")" = "$target" ]; then
    echo "[+] Found: $pass"
    break
  fi
done <dictionary-list.txt
```

実行結果
```
localhost:~# ./solve.sh 
[+] Found: Aix-les-Bains
```

## Flag

```
{Aix-les-Bains}
```