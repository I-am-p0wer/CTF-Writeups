## Password_Please

Bashで初めてのパスワードチェッカーを書きました。ログインしてください。

▶ 初心者向けヒント
Bashの`[[…]]`内にある`==`は、右辺がquoteされていないとき、どのように比較するでしょうか。


## Solution

```bash
secret="${RANDOM}${RANDOM}${RANDOM}${RANDOM}"

printf 'Password: '
read -r password

if [[ $secret == $password ]]; then
    cat /flag.txt
else
    echo 'Access denied'
fi
```

接続すると`Password`を求められ、入力した値が`secret`と一致した場合、`flag.txt`が表示されるようだ。

`secret`の値は`${RANDOM}`によってランダムな整数が指定される。

`${RANDOM}`は参照するたびに0〜32767までの範囲のランダムな整数（疑似乱数）を返す。らしいので実験してみる。

```Bash
$ echo $RANDOM
591
$ echo $RANDOM
6061
$ echo $RANDOM$RANDOM
2535927207
```

`$RANDOM$RANDOM$RANDOM$RANDOM`ならば組み合わせの総数は(32768^4)=1152921504606846976通りとなり、`secret`を予測することは到底不可能そうだ。
`secret`の値に関係なく、突破方法を考えよう。

ヒントを見てみる。
```
▼初心者向けヒント
Bashの[[…]]内にある==は、右辺がquoteされていないとき、どのように比較するでしょうか。
```

では「quoteされてない」とはなにか？
```
「quoteされていない（クォートされていない）」とは、文字列の囲み文字（ダブルクォーテーション"やシングルクォーテーション'など）が欠けている状態を指します。
```
とのこと

Quote有無を表にまとめるとこうなる。

| 記述 | 右辺の評価 |
| :--- | :--- |
| `[[ $secret == $password ]]` | パターンマッチ（ワイルドカード比較） |
| `[[ $secret == "$password" ]]` | 完全な文字列一致（リテラル比較） |

今回は`[[ $secret == $password ]]`であるのでワイルドカード`*(0文字以上の任意の文字列)`,`?(任意の1文字)`が使用可能。

`*`を入力した場合
```
if [[ $secret == *]] #0文字以上の任意の文字列と一致するか？
```
となりワイルドカードにより条件を突破できる。


`[[ $secret == “$password” ]]`だった場合
`*`を入力しても

```
if [[ $secret == “*”]] #”*”と一致するか？
```
となり突破できない。

よって

```Bash
# nc 34.170.146.252 28908
Password: *
Alpaca{welcome_to_the_terminal}
```

## Flag
```
Alpaca{welcome_to_the_terminal}
```