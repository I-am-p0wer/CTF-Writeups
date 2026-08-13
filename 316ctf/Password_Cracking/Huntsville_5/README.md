## [PasswordCracking]Huntsville_5

All of these are the same password. The hashes are different because the salt is different. The flag is the password of any one of these.

$5$cTvvJTWhtlqSVuFi$fDT5L1w24UbMzDDoo7fILXrzXW7I0verRcLT/gGCbT.

$5$yylBCE6iCndphfxJ$XFuTxISOmZuIvnOLcZtbQvQv24QGxvYjwF/R2R4dhBA

$5$mUMcyLuBjpqmtWD4$eWN74FtYbqS4tb688SC8Zqlp7Q0XelHeENnOzjJluzB

$5$.SAhoYtm62SU2qUe$LX.raK2g9HaEVbto/YDaOusohIzjxsckQh2yoWbRa5/

$5$7OWDOSA5lUtbZOAf$1R0M5fQ/lH9JD.EXPixen1BhLAescECVdejQVqM729B

## Solution

ソルトが異なるためハッシュ値も異なるがパスワードは全て同じになるためどれでもいい

solve.sh
```bash

target='$5$cTvvJTWhtlqSVuFi$fDT5L1w24UbMzDDoo7fILXrzXW7I0verRcLT/gGCbT.'
while read -r pass; do
  if [ "$(mkpasswd -m sha-256 -S cTvvJTWhtlqSVuFi "$pass")" = "$target" ]; then
    echo "[+] Found: $pass"
    break
  fi
done <dictionary-list.txt
```

実行結果
```
localhost:~# ./solve.sh 
[+] Found: Anderson
```
## Flag

```
{Anderson}
```