
## Q12.[Crypto][10pt]HashHashHash!

ハッシュ関数とは、値を入れたら絶対にもとに戻せないハッシュ値と呼ばれる値が返ってくる関数です。  
ですが、レインボーテーブルなどでいくつかのハッシュ関数は元に戻せてしまう時代になってしまいました。  
以下のSHA1というハッシュ関数で作られたハッシュ値を元に戻してみてください！（ヒント：googleで検索）  
  
e4c6bced9edff99746401bd077afa92860f83de3  
  
フラグは  
cpaw{ハッシュを戻した値}  
です。

## Solution

hash-analyzerを使う。
https://www.tunnelsup.com/hash-analyzer/

| **Hash:**             | e4c6bced9edff99746401bd077afa92860f83de3 |
| --------------------- | ---------------------------------------- |
| **Hash type:**        | SHA1 (or SHA 128)                        |
| **Bit length:**       | 160                                      |
| **Character length:** | 40                                       |
| **Character type:**   | hexidecimal                              |
SHA1であることがわかる。

適当なサイトで出た。
https://md5decrypt.net/en/Sha1/

```
Shal
```

## Flag

cpaw{Shal}