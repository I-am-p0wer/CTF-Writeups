
## [230pt]Phantom_4

Follow the TCP stream in PHANTOM.pcap - decode the beacon payload (XOR key: 0x55).
What is the PID?

## Solution

```
localhost:~# tshark -r PHANTOM.pcap -q -z follow,tcp,hex,0
===================================================================
Follow: tcp,hex
Filter: tcp.stream eq 0
Node 0: 10.0.0.5:49152
Node 1: 185.220.101.47:4444
00000000  14 12 10 1b 01 68 05 1d  14 1b 01 1a 18 5f 05 1c  .....h.. ....._..
00000010  11 68 64 66 66 62 5f 00  1c 11 68 65 5f           .hdffb_. ..he_
00000000  59 32 46 30 49 43 39 6c  64 47 4d 76 63 32 68 68  Y2F0IC9l dGMvc2hh
00000010  5a 47 39 33                                       ZG93
===================================================================
localhost:~# 
```

`Y2F0IC9ldGMvc2hhZG93`はbase64で`cat /etc/shadow`

`1412101b0168051d141b011a185f051c1168646666625f001c1168655f`は0x55とXORする。

```Python
raw_data = bytes.fromhex("1412101b0168051d141b011a185f051c1168646666625f001c1168655f")

# 0x55 で XOR
decrypted = bytes([b ^ 0x55 for b in raw_data])

print(decrypted.decode('ascii'))
```

実行結果
```
AGENT=PHANTOM
PID=1337
UID=0
```
## Flag
```
1337
```