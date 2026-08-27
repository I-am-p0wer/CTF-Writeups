## morse_one

友人から「秘密のメッセージを送るね」とあるテキストファイルが送られてきました。どうやらそのままでは読めないようです。添付されたファイルを解析し、秘密のメッセージを見つけ出してください。

フラグは得られた文字列を flag{} で囲んで答えてください。フラグに英字が含まれている場合はすべて大文字で答えてください。例えば得られた文字列が Flag の場合は flag{FLAG} となります。

## Solution

```
DDDBSDDSBDDDSDBDSBBBSDBBDSDBDDSDSBDDB
```

## Solution

モールス信号に変換する。
```
D -> .
B -> -
S -> ' '(スペース)
```

https://morse.ariafloat.com/en/


```
flag{VIBROPLEX}
```