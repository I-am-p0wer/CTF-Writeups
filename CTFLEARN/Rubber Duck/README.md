## Rubber Duck

10 points Easy

Find the flag! Simple forensics challenge to get started with.

## Solution

fileコマンドは、拡張子に依存せずファイルの内容を解析して、そのファイルの本当の種類を特定する。

```bash
# file RubberDuck.jpg 
RubberDuck.jpg: JPEG image data, JFIF standard 1.01, aspect ratio, density 72x72, segment length 16, comment: "CTFlearn{ILoveJakarta}", progressive, precision 8, 1536x2048, components 3
```

## Flag

```
CTFlearn{ILoveJakarta}
```