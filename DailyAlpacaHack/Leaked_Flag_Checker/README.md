## Leaked_Flag_Checker

みんなだいすきフラグチェッカー

▼初心者向けヒント

* この問題は Rev カテゴリー、すなわち Reverse Engineering に関する問題です。
* フラグチェッカーは、Rev の問題によくある題材の一つです。
* フラグチェッカーと呼ばれる実行ファイルやスクリプトが、プレイヤーの入力を受け取り、その入力がフラグと一致するかどうかを出力します。
* この問題の配布ファイルでは、C言語のソースコード `challenge.c` とそれを `Ubuntu 24.04`でコンパイルしたバイナリ `challenge`が与えられています。
* ただし、ソースコード `challenge.c`においてフラグに関わる文字列である `xor_flag`の値は編集され隠されています。
* 今回のゴールは、`challenge.c`のコードを参考に、 `challenge` バイナリの出力が `Correct`となるような入力（= フラグ）を探すことです。
* ちなみに一般的に Rev の問題では、バイナリのソースコードは与えられず、バイナリ単体で解析する必要があります。この問題もソースコード無しで解くことができます。

## Solution

```bash
# file challenge
challenge: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2,BuildID[sha1]=5d2c86ed744df49647f3bd9cee8cfc4a90041315, for GNU/Linux 3.2.0, not stripped
```

ソースはこれ。
```c

#include <stdio.h>
#include <string.h>

int main(void) {
    char input[32];
    const char xor_flag[] = "REDACTED";
    size_t flag_len = strlen(xor_flag);

    printf("Enter flag: ");
    fflush(stdout);
    scanf("%31s", input);

    if(strlen(input) != flag_len) {
        printf("Wrong length\n");
        return 1;
    }
    for(size_t i = 0; i < flag_len; i++) {
        if((input[i] ^ 7) != xor_flag[i]) {
            printf("Wrong at index %zu\n", i);
            return 1;
        }
    }
    printf("Correct\n");
    return 0;
}
```

逆アセンブル
```bash
# objdump -d -M intel --disassemble=main challenge

(省略)

1204:  movabs rax,0x6b7c666466776b46
120e:  mov QWORD PTR [rbp-0x3e],rax
1212:  movabs rax,0x7a7e6c64726b7c

(省略)
```

`1204`と`1212`が怪しい？


とりあえず繋げて文字に直してみる。
```python
result = ''
for b in bytes.fromhex("6b7c666466776b467a7e6c64726b7c"):
	result += chr(b)
print(result)
```

実行結果
```
k|fdfwkFz~ldrk|
```

7とXORしてるっぽいので少し修正

```Python
result = ''
for b in bytes.fromhex("6b7c666466776b467a7e6c64726b7c"):
	#result += chr(b)
	result += chr(b^7)
print(result)
```
実行結果
```
l{acaplA}ykcul{
```

リトルエンディアンだから逆になるのか？
結合も前後逆転だったみたい。余計な文字も入ってるし。
まぁ、今回はこれで

## Flag

```
Alpaca{lucky}
```