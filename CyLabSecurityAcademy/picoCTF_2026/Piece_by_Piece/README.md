## Piece_by_Piece

General Skills

Easy

After logging in, you will find multiple file parts in your home directory. These parts need to be combined and extracted to reveal the flag. SSH to chatelaine.cylabacademy.net:24732 and login as ctf-player with password 4f5344cd.

## Solution

Sshで`chatelaine.cylabacademy.net:24732`に接続する。

```bash
ctf-player@chatelaine.cylabacademy.net -p 24732
```

パスワードは`4f5344cd`
```bash
ctf-player@chatelaine.cylabacademy.net's password: 
```

```bash
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 7.0.0-1018-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, you can run the 'unminimize' command.

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.
```

```bash
ctf-player@academy-chall$ ls
instructions.txt  part_ab  part_ad
part_aa           part_ac  part_ae
```


`instructions.txt`を見る

```
ctf-player@academy-chall$ cat instructions.txt 
Hint:

- The flag is split into multiple parts as a zipped file.
- Use Linux commands to combine the parts into one file.
- The zip file is password protected. Use this "supersecret" password to extract the zip file.
- After unzipping, check the extracted text file for the flag.
```

ZipがSplitされている
結合して一つのファイルにすること
パスワードはsupersecret
であることがわかる

```
#catを使い結合
ctf-player@academy-chall$ cat part_aa part_ab part_ac part_ad part_ae > merge

#またはこっち
ctf-player@academy-chall$ cat part_* > merge
```

Zipを解凍する

```
ctf-player@academy-chall$ unzip merge 
Archive:  merge
[merge] flag.txt password: 
```

Flagを得る

```
ctf-player@academy-chall$ cat flag.txt 
academy{z1p_and_spl1t_f1l3s_4r3_fun_2cd7190f}
```

## Flag

```
academy{z1p_and_spl1t_f1l3s_4r3_fun_2cd7190f}
```

