## [VeryEasy][Linux]Meow

### Task 1

In cybersecurity, isolated environments—like Pwnbox or the vulnerable target machines—are often VMs. What does VM stand for?

```
Virtual Machine
```

### Task 2

What tool do we use to interact with the operating system in order to issue commands via the command line, such as the one to start our VPN connection? It's also known as a console or shell.

```
terminal
```

### Task 3

What service do we use to form our VPN connection into HTB labs?

```
openvpn
```

### Task 4

What tool do we use to test our connection to the target with an ICMP echo request?

```
ping
```

### Task 5

What is the name of the most common tool for finding open ports on a target?

```
nmap
```

Task 6

What service do we identify on port 23/tcp during our scans?

```
telnet
```

Task 7

What username is able to log into the target over telnet with a blank password?

```
root
```

```
$ telnet 10.129.103.81
Trying 10.129.103.81...
Connected to 10.129.103.81.
Escape character is '^]'.

  █  █         ▐▌     ▄█▄ █          ▄▄▄▄
  █▄▄█ ▀▀█ █▀▀ ▐▌▄▀    █  █▀█ █▀█    █▌▄█ ▄▀▀▄ ▀▄▀
  █  █ █▄█ █▄▄ ▐█▀▄    █  █ █ █▄▄    █▌▄█ ▀▄▄▀ █▀█

Meow login: root
Welcome to Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-77-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue 25 Aug 2026 02:19:12 AM UTC

  System load:           0.07
  Usage of /:            41.7% of 7.75GB
  Memory usage:          4%
  Swap usage:            0%
  Processes:             143
  Users logged in:       0
  IPv4 address for eth0: 10.129.103.81
  IPv6 address for eth0: dead:beef::a0de:adff:feac:5716

 * Super-optimized for small spaces - read how we shrank the memory
   footprint of MicroK8s to make it the smallest full K8s around.

   https://ubuntu.com/blog/microk8s-memory-optimisation

75 updates can be applied immediately.
31 of these updates are standard security updates.
To see these additional updates run: apt list --upgradable


The list of available updates is more than a week old.
To check for new updates run: sudo apt update

Last login: Mon Sep  6 15:15:23 UTC 2021 from 10.10.14.18 on pts/0
root@Meow:~# 

```

Submit Single Flag

Submit the flag located in root's home directory.

```
root@Meow:~# cat flag.txt 
```


```
REDACTED
```