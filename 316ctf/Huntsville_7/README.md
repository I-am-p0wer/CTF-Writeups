## [PasswordCracking]Huntsville_7

$5$hceGcQuSsS9bhmHf$C3uPJNRmUkC8hShJcRwX1QISxzZWCWY0LsK7.0idxE/

## Solution

solve.sh
```bash
target='$5$hceGcQuSsS9bhmHf$C3uPJNRmUkC8hShJcRwX1QISxzZWCWY0LsK7.0idxE/'
while read -r pass; do
  if [ "$(mkpasswd -m sha-256 -S hceGcQuSsS9bhmHf "$pass")" = "$target" ]; then
    echo "[+] Found: $pass"
    break
  fi
done <dictionary-list.txt

```

実行結果
```
localhost:~# ./solve.sh 
[+] Found: Wyoming
```
## Flag

```
{Wyoming}
```