## Bandit_13

Bandit Level 13 → Level 14

Level Goal

The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level. Look at the commands that logged you into previous bandit levels, and find out how to use the key for this level.
If you need help with this level: a hint file can be found in the home directory.
Make sure to read the error messages as they are informative.

Commands you may need to solve this level

ssh, scp, umask, chmod, cat, nc, install


## Solution

```Bash
bandit13@bandit:~$ ls
HINT  sshkey.private

#ヒントみる
bandit13@bandit:~$ cat HINT 
If you have trouble with this level, note the following:

1) As for all other levels, this level has a website with information:
   https://overthewire.org/wargames/bandit/bandit14.html
2) No, the level is not broken. To verify, see:
   https://status.overthewire.org/
3) The current version of OverTheWire prevents logging in from one
   level to another via localhost. Log out, and see 1)
4) If you get errors, read the error message on your screen.
   We mean it!

bandit13@bandit:~$ logout

#sshkey.privateをダウンロード
# scp -P 2220 bandit13@bandit.labs.
overthewire.org:sshkey.private ./
                         _                     _ _ _   
                        | |__   __ _ _ __   __| (_) |_ 
                        | '_ \ / _` | '_ \ / _` | | __|
                        | |_) | (_| | | | | (_| | | |_ 
                        |_.__/ \__,_|_| |_|\__,_|_|\__|
                                                       

                      This is an OverTheWire game server. 
            More information on http://www.overthewire.org/wargames

backend: gibson-1
bandit13@bandit.labs.overthewire.org's password: 
sshkey.priv 100% 2602     7.7KB/s   00:00    


#ls
sshkey.private

#読み書き権限付与
#chmod 600 sshkey.private

#key使って接続
# ssh -i sshkey.private -p 2220 bandit14@bandit.labs.overthewire.org

bandit14@bandit:~$ cd  /etc/bandit_pass/

bandit14@bandit:/etc/bandit_pass$ ls
bandit0   bandit17  bandit25  bandit33
bandit1   bandit18  bandit26  bandit4
bandit10  bandit19  bandit27  bandit5
bandit11  bandit2   bandit28  bandit6
bandit12  bandit20  bandit29  bandit7
bandit13  bandit21  bandit3   bandit8
bandit14  bandit22  bandit30  bandit9
bandit15  bandit23  bandit31
bandit16  bandit24  bandit32

bandit14@bandit:/etc/bandit_pass$ cat bandit14
aaWecNkG4FhxJQxz07uiwzVP6bJiYS65
```