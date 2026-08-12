## [PasswordCracking]Huntsville_1

In the previous examples, we conducted basic password cracking of MD5 and SHA1 hashes. However, if you stumble across password hashes on a Linux machine, you'll probably find them in the /etc/shadow file. This is where all Linux user passwords are hashed and stored.

Please know what a password salt is. Also, understand the fields of an /etc/shadow file (https://linuxize.com/post/etc-shadow-file/). The fields are generally delimited/separated by dollar signs. $5$ indicates the password has been hashed with SHA256.

Crack the password, that is the flag.

$5$JS4kTGQpJsuKAq7f$8yHlRHpl5IDzMbNttD3zfmxoBHSQZ7ENFkBGnzVXyI3

E.g., {Password}

## Solution

```
$5$JS4kTGQpJsuKAq7f$8yHlRHpl5IDzMbNttD3zfmxoBHSQZ7ENFkBGnzVXyI3
```

|フィールド|役割|説明|
|---|---|---|
| `$5$` | 識別子 | SHA-256|
| `JS4kTGQpJsuKAq7f` | ソルト（Salt） |ハッシュの強度を高めるために追加されるランダムな文字列。|
| `8yHlRHpl5IDzMbNttD3zfmxoBHSQZ7ENFkBGnzVXyI3` | ハッシュ値本体 | パスワードとソルトを組み合わせ、ストレッチング計算を行って生成される。 |

`SHA-256`を使用している。
辞書ファイルは引き続き`dictionary-list.txt`を使用する。

solve.sh
```bash

#ハッシュ値
target='$5$JS4kTGQpJsuKAq7f$8yHlRHpl5IDzMbNttD3zfmxoBHSQZ7ENFkBGnzVXyI3'

#dictionary-list.txtから一行読み込みループ
while read -r pass; do
　#mkpasswd⁠: パスワードからハッシュ値生成
  if [ "$(mkpasswd -m sha-256 -S JS4kTGQpJsuKAq7f "$pass")" = "$target" ]; then
    echo "[+] Found: $pass"
    break
  fi
done <dictionary-list.txt
```

実行結果
```
localhost:~# ./solve.sh 
[+] Found: Abingdon
```

## Flag

```
{Abingdon}
```