## Bandit_14

Bandit Level 14 → Level 15

Level Goal

The password for the next level can be retrieved by submitting the password of the current level to port 30000 on localhost.

Commands you may need to solve this level

ssh, telnet, nc, openssl, s_client, nmap

## Solution

```bash
#ポートスキャン
bandit14@bandit:~$ nmap localhost 
Starting Nmap 7.98 ( https://nmap.org ) at 2026-08-28 23:06 +0000
Nmap scan report for localhost (127.0.0.1)
Host is up (0.000091s latency).
Other addresses for localhost (not scanned): ::1
Not shown: 993 closed tcp ports (conn-refused)
PORT      STATE SERVICE
22/tcp    open  ssh
1111/tcp  open  lmsocialserver
1840/tcp  open  netopia-vo2
4321/tcp  open  rwhois
8000/tcp  open  http-alt
30000/tcp open  ndmps
50001/tcp open  unknown

Nmap done: 1 IP address (1 host up) scanned in 0.05 seconds

#30000にtelnet
bandit14@bandit:~$ telnet localhost 30000
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
#パスワード送信
aaWecNkG4FhxJQxz07uiwzVP6bJiYS65
Correct!
pbLYuZtTg4MgaqfJx8jbA9gKKGqM68A7

Connection closed by foreign host.
```