# Q11.[Network][10pt]pcap

ネットワークを流れているデータはパケットというデータの塊です。  
それを保存したのがpcapファイルです。  
pcapファイルを開いて、ネットワークにふれてみましょう！  
[pcapファイル](https://ctf.cpaw.site/download.php?param=122eb1b9441d332956aeded504df3d85)

## Solution


```
localhost:~# tshark -r network10.pcap 
1   0.000000 169.254.144.80 → 169.254.144.81 IPv4 60 IPv6 hop-by-hop options[Malformed Packet]

2   0.000080 169.254.144.81 → 169.254.144.80 ICMP 82 Destination unreachable (Protocol unreachable)
```


`[Malformed Packet]`（不正なパケット）？

```
localhost:~# tshark -r network10.pcap -x -c 1
0000  70 58 12 24 49 0d 58 55 ca 24 2e 08 08 00 45 00   pX.$I.XU.$....E.
0010  00 28 00 01 00 00 40 00 06 37 a9 fe 90 50 a9 fe   .(....@..7...P..
0020  90 51 63 70 61 77 7b 67 6f 63 68 69 5f 75 73 61   .Qcpaw{gochi_usa
0030  5f 6b 61 6d 69 7d 00 00 00 00 00 00               _kami}......
```

## Flag
```
cpaw{gochi_usa_kami}
```