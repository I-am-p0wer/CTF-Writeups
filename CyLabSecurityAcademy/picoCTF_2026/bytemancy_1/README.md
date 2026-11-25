## bytemancy_1

General Skills

Easy

Can you conjure the right bytes? The program's source code can be downloaded here

## Solution

ソースコード
```
while(True):
  try:
    print('竓ｹ笏笏笏笏笏笏[ BYTEMANCY-1 ]笏笏笏笏笏笏竓ｹ')
    print("笘坂汾笘俄汪笘ｽ笘遺氈筴銀泯笘坂汾笘俄汪笘ｽ笘遺氈筴銀泯笘坂汾笘俄汪笘ｽ笘遺氈筴銀泯笘坂汾")
    print()
    print('Send me ASCII DECIMAL 101 1751 times, side-by-side, no space.')
    print()
    print("笘坂汾笘俄汪笘ｽ笘遺氈筴銀泯笘坂汾笘俄汪笘ｽ笘遺氈筴銀泯笘坂汾笘俄汪笘ｽ笘遺氈筴銀泯笘坂汾")
    print('竓ｹ笏笏笏笏笏笏笏笏笏笏笏笏笏筺｡笏笏笏笏笏笏笏笏笏笏笏笏笏竓ｹ')
    user_input = input('==> ')
    if user_input == "\x65"*1751:
      print(open("./flag.txt", "r").read())
      break
    else:
      print("That wasn't it. I got: " + str(user_input))
      print()
      print()
      print()
  except Exception as e:
    print(e)
    break
```

```
⊹──────[ BYTEMANCY-1 ]──────⊹
☍⟐☉⟊☽☈⟁⧋⟡☍⟐☉⟊☽☈⟁⧋⟡☍⟐☉⟊☽☈⟁⧋⟡☍⟐

Send me ASCII DECIMAL 101 1751 times, side-by-side, no space.

☍⟐☉⟊☽☈⟁⧋⟡☍⟐☉⟊☽☈⟁⧋⟡☍⟐☉⟊☽☈⟁⧋⟡☍⟐
⊹─────────────⟡─────────────⊹
==> 
```

### 何を要求されているか

```
if user_input == "\x65"*1751:
```

\x65 は16進数の 65、つまりASCIIの e（10進数で101）。
したがって、プログラムが求めているのは、
ASCII文字 e
10進数で 101
それを 1751回連続
空白なし
という入力。

Pythonを使ってeを1751個流し込む。

Python
e を1751文字生成＋改行
cat
入力をそのまま引き継ぐ
nc
サーバーにデータ送信

という流れになる。
```
(python3 -c 'print("e" * 1751)'; 
cat) | nc xebec.cylabacademy.net 47192
```


なぜ cat が必要なのか？
Pythonだけで送信すると、文字列を送ったあと入力側が終了する。
でも、サーバーとの接続や入力状態によっては、送信後すぐに接続が閉じてしまう。

```
python3 -c 'print("e" * 1751)' | nc xebec.cylabacademy.net 47192
```
そこで、

```
(python3 -c 'print("e" * 1751)'; cat) | nc ...
```

とすることで、
Pythonが1751個の e を送る
Pythonが終了する
cat が標準入力を引き継ぐ
入力が閉じられるまで接続を維持する
という動作になる。

### 実行結果
```
localhost:~# (python3 -c 'print("e" * 1751)'; 
cat) | nc xebec.cylabacademy.net 47192
⊹──────[ BYTEMANCY-1 ]──────⊹
☍⟐☉⟊☽☈⟁⧋⟡☍⟐☉⟊☽☈⟁⧋⟡☍⟐☉⟊☽☈⟁⧋⟡☍⟐

Send me ASCII DECIMAL 101 1751 times, side-by-side, no space.

☍⟐☉⟊☽☈⟁⧋⟡☍⟐☉⟊☽☈⟁⧋⟡☍⟐☉⟊☽☈⟁⧋⟡☍⟐
⊹─────────────⟡─────────────⊹
==> academy{h0w_m4ny_e's???_17ac1ce5}
```

## Flag

```
academy{h0w_m4ny_e's???_17ac1ce5}
```
