## [PasswordCracking]Huntsville_8

$5$dPMIubfJrKXXhTFZ$F7N2uXuPDnNDAv9d4ztOj8myBecZldvZpA01PRay5c.

## Solution

solve.sh
```bash
target='$5$dPMIubfJrKXXhTFZ$F7N2uXuPDnNDAv9d4ztOj8myBecZldvZpA01PRay5c.'
while read -r pass; do
  if [ "$(mkpasswd -m sha-256 -S dPMIubfJrKXXhTFZ "$pass")" = "$target" ]; then
    echo "[+] Found: $pass"
    break
  fi
done <dictionary-list.txt
```

実行結果
```
localhost:~# ./solve.sh 
[+] Found: zaniness
```
## Flag

```
{zaniness}
```