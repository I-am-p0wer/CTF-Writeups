## Rev_Your_Engines_5

Decrypt this text. What is this form of apparently meaningless text called?

Olivn rkhfn wloli hrg znvg, xlmhvxgvgfi zwrkrhxrmt vorg, hvw wl vrfhnlw gvnkli rmxrwrwfmg fg ozyliv vg wloliv nztmz zorjfz. Fg vmrn zw nrmrn evmrzn, jfrh mlhgifw vcvixrgzgrlm fooznxl ozylirh mrhr fg zorjfrk vc vz xlnnlwl xlmhvjfzg. Wfrh zfgv rifiv wloli rm ivkivsvmwvirg rm elofkgzgv evorg vhhv xroofn wloliv vf uftrzg mfooz kzirzgfi. Vcxvkgvfi hrmg lxxzvxzg xfkrwzgzg mlm kilrwvmg, hfmg rm xfokz jfr luurxrz wvhvifmg nloorg zmrn rw vhg ozylifn

E.g., {Some String}

## Solution

アトバシュ暗号（Atbash Cipher）

A > Z

B > Y

C > X

記号はそのまま残す。

```python 

ABC = 'abcdefghijklmnopqrstuvwxyz .-,'
ZYX = 'zyxwvutsrqponmlkjihgfedcba .,-'

#全部小文字にする
input = input('> ').lower() 

for i in input:
    if i in ABC:
        index = ABC.index(i)
        print(ZYX[index], end='')
```

実行結果
```

> Olivn rkhfn wloli hrg znvg, xlmhvxgvgfi zwrkrhxrmt vorg, hvw wl vrfhnlw gvnkli rmxrwrwfmg fg ozyliv vg wloliv nztmz zorjfz. Fg vmrn zw nrmrn evmrzn, jfrh mlhgifw vcvixrgzgrlm fooznxl ozylirh mrhr fg zorjfrk vc vz xlnnlwl xlmhvjfzg. Wfrh zfgv rifiv wloli rm ivkivsvmwvirg rm elofkgzgv evorg vhhv xroofn wloliv vf uftrzg mfooz kzirzgfi. Vcxvkgvfi hrmg lxxzvxzg xfkrwzgzg mlm kilrwvmg, hfmg rm xfokz jfr luurxrz wvhvifmg nloorg zmrn rw vhg ozylifn
lorem ipsum dolor sit amet- consectetur adipiscing elit- sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ut enim ad minim veniam- quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. excepteur sint occaecat cupidatat non proident- sunt in culpa qui officia deserunt mollit anim id est laborum

```
このテキストは一般的に「ロレム・イプサム（Lorem Ipsum）」と呼ばれている。

## Flag
```
{Lorem Ipsum}
```