# Q7.[Reversing] [10pt]Can_you_execute_?

拡張子がないファイルを貰ってこのファイルを実行しろと言われたが、どうしたら実行出来るのだろうか。  
この場合、UnixやLinuxのとあるコマンドを使ってファイルの種類を調べて、適切なOSで実行するのが一般的らしいが…  

## Solution
```shell
ubuntu@instance:~$ file exec_me 
exec_me: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.24, BuildID[sha1]=663a3e0e5a079fddd0de92474688cd6812d3b550, not stripped
ubuntu@instance:~$ chmod +x exec_me 
ubuntu@instance:~$ ./exec_me 
cpaw{Do_you_know_ELF_file?}
```
## Flag 
```
cpaw{Do_you_know_ELF_file?}
```
