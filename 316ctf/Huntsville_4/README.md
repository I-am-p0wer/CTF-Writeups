## [PasswordCracking]Huntsville_4

$5$J1me1bKg7Wv6Gm92$rNRVLqqdqeleT7kXddxY5JBs00aApWznC0LbufJ.7h8

## Solution

solve.sh
```bash
target='$5$J1me1bKg7Wv6Gm92$rNRVLqqdqeleT7kXddxY5JBs00aApWznC0LbufJ.7h8'
while read -r pass; do
  if [ "$(mkpasswd -m sha-256 -S J1me1bKg7Wv6Gm92 "$pass")" = "$target" ]; then
    echo "[+] Found: $pass"
    break
  go
done <dictionary-list.txt

```

実行結果
```
localhost:~# ./solve.sh 
[+] Found: Bannockburn
```
## Flag

```
{Bannockburn}
```