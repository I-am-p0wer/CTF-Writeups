## Bandit_15

Bandit Level 15 → Level 16

Level Goal

The password for the next level can be retrieved by submitting the password of the current level to port 30001 on localhost using SSL/TLS encryption.

Helpful note: Getting “DONE”, “RENEGOTIATING” or “KEYUPDATE”? Read the “CONNECTED COMMANDS” section in the manpage.

Commands you may need to solve this level

ssh, telnet, nc, ncat, socat, openssl, s_client, nmap, netstat, ss

## Solution

```bash
bandit15@bandit:~$ openssl s_client -connect localhost:30001

Connecting to 127.0.0.1
CONNECTED(00000003)
Can't use SSL_get_servername
depth=0 CN=SnakeOil
verify error:num=18:self-signed certificate
verify return:1
depth=0 CN=SnakeOil
verify return:1
---
Certificate chain
 0 s:CN=SnakeOil
   i:CN=SnakeOil
   a:PKEY: RSA, 4096 (bit); sigalg: sha256WithRSAEncryption
   v:NotBefore: Jun 10 03:59:50 2024 GMT; NotAfter: Jun  8 03:59:50 2034 GMT
---
Server certificate
-----BEGIN CERTIFICATE-----
MIIFBzCCAu+gAwIBAgIUBLz7DBxA0IfojaL/WaJzE6Sbz7cwDQYJKoZIhvcNAQEL
BQAwEzERMA8GA1UEAwwIU25ha2VPaWwwHhcNMjQwNjEwMDM1OTUwWhcNMzQwNjA4
MDM1OTUwWjATMREwDwYDVQQDDAhTbmFrZU9pbDCCAiIwDQYJKoZIhvcNAQEBBQAD
ggIPADCCAgoCggIBANI+P5QXm9Bj21FIPsQqbqZRb5XmSZZJYaam7EIJ16Fxedf+
jXAv4d/FVqiEM4BuSNsNMeBMx2Gq0lAfN33h+RMTjRoMb8yBsZsC063MLfXCk4p+
09gtGP7BS6Iy5XdmfY/fPHvA3JDEScdlDDmd6Lsbdwhv93Q8M6POVO9sv4HuS4t/
jEjr+NhE+Bjr/wDbyg7GL71BP1WPZpQnRE4OzoSrt5+bZVLvODWUFwinB0fLaGRk
GmI0r5EUOUd7HpYyoIQbiNlePGfPpHRKnmdXTTEZEoxeWWAaM1VhPGqfrB/Pnca+
vAJX7iBOb3kHinmfVOScsG/YAUR94wSELeY+UlEWJaELVUntrJ5HeRDiTChiVQ++
wnnjNbepaW6shopybUF3XXfhIb4NvwLWpvoKFXVtcVjlOujF0snVvpE+MRT0wacy
tHtjZs7Ao7GYxDz6H8AdBLKJW67uQon37a4MI260ADFMS+2vEAbNSFP+f6ii5mrB
18cY64ZaF6oU8bjGK7BArDx56bRc3WFyuBIGWAFHEuB948BcshXY7baf5jjzPmgz
mq1zdRthQB31MOM2ii6vuTkheAvKfFf+llH4M9SnES4NSF2hj9NnHga9V08wfhYc
x0W6qu+S8HUdVF+V23yTvUNgz4Q+UoGs4sHSDEsIBFqNvInnpUmtNgcR2L5PAgMB
AAGjUzBRMB0GA1UdDgQWBBTPo8kfze4P9EgxNuyk7+xDGFtAYzAfBgNVHSMEGDAW
gBTPo8kfze4P9EgxNuyk7+xDGFtAYzAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3
DQEBCwUAA4ICAQAKHomtmcGqyiLnhziLe97Mq2+Sul5QgYVwfx/KYOXxv2T8ZmcR
Ae9XFhZT4jsAOUDK1OXx9aZgDGJHJLNEVTe9zWv1ONFfNxEBxQgP7hhmDBWdtj6d
taqEW/Jp06X+08BtnYK9NZsvDg2YRcvOHConeMjwvEL7tQK0m+GVyQfLYg6jnrhx
egH+abucTKxabFcWSE+Vk0uJYMqcbXvB4WNKz9vj4V5Hn7/DN4xIjFko+nREw6Oa
/AUFjNnO/FPjap+d68H1LdzMH3PSs+yjGid+6Zx9FCnt9qZydW13Miqg3nDnODXw
+Z682mQFjVlGPCA5ZOQbyMKY4tNazG2n8qy2famQT3+jF8Lb6a4NGbnpeWnLMkIu
jWLWIkA9MlbdNXuajiPNVyYIK9gdoBzbfaKwoOfSsLxEqlf8rio1GGcEV5Hlz5S2
txwI0xdW9MWeGWoiLbZSbRJH4TIBFFtoBG0LoEJi0C+UPwS8CDngJB4TyrZqEld3
rH87W+Et1t/Nepoc/Eoaux9PFp5VPXP+qwQGmhir/hv7OsgBhrkYuhkjxZ8+1uk7
tUWC/XM0mpLoxsq6vVl3AJaJe1ivdA9xLytsuG4iv02Juc593HXYR8yOpow0Eq2T
U5EyeuFg5RXYwAPi7ykw1PW7zAPL4MlonEVz+QXOSx6eyhimp1VZC11SCg==
-----END CERTIFICATE-----
subject=CN=SnakeOil
issuer=CN=SnakeOil
---
No client certificate CA names sent
Peer signing digest: SHA256
Peer signature type: rsa_pss_rsae_sha256
Negotiated TLS1.3 group: X25519MLKEM768
---
SSL handshake has read 3191 bytes and written 1613 bytes
Verification error: self-signed certificate
---
New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384
Protocol: TLSv1.3
Server public key is 4096 bit
This TLS version forbids renegotiation.
Compression: NONE
Expansion: NONE
No ALPN negotiated
Early data was not sent
Verify return code: 18 (self-signed certificate)
---
---
Post-Handshake New Session Ticket arrived:
SSL-Session:
    Protocol  : TLSv1.3
    Cipher    : TLS_AES_256_GCM_SHA384
    Session-ID: 3535595A3D3F4AE4F1C796FBE3CAE33442D9F61D2A3B41C14CFFF2BD4E7D8B6E
    Session-ID-ctx: 
    Resumption PSK: 9A2D4B8BA787907454A0524C53DB86373F30067BBFE36890E0AA86942DDF3E635E7976B26EF5F8D843EC4B71FF146595
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 300 (seconds)
    TLS session ticket:
    0000 - d3 36 31 7d b1 9c 35 85-7c 6b 2c a8 28 1c e7 d8   .61}..5.|k,.(...
    0010 - 0b 95 cb 30 18 16 d0 89-9e f0 e0 fc e4 de b6 21   ...0...........!
    0020 - 9b 6d e6 5c 89 14 62 e0-59 d7 77 cc ae c4 ef 65   .m.\..b.Y.w....e
    0030 - d6 4c 9c e6 7b 08 e8 11-17 f8 03 9f 6f ee 72 a8   .L..{.......o.r.
    0040 - 9f e5 15 0e e8 03 b7 81-7e f2 f3 2a c6 40 c2 f3   ........~..*.@..
    0050 - 50 48 7c 3c c0 b1 bb 62-38 a1 8e 98 0b 84 0a 8e   PH|<...b8.......
    0060 - 22 04 28 63 e6 17 87 a9-3e 42 e4 f3 6f bf 14 11   ".(c....>B..o...
    0070 - 96 5d 6b 1d 74 04 f1 eb-ea 52 99 53 65 12 ae c9   .]k.t....R.Se...
    0080 - 05 99 f8 7a 47 b5 a9 88-82 0e 4f 29 90 09 e8 51   ...zG.....O)...Q
    0090 - 42 48 b5 9c 40 e1 83 b7-4d 0f 3e 68 3c a4 d5 aa   BH..@...M.>h<...
    00a0 - 36 3f 62 72 e5 6c 9a ee-6a 52 82 4b 9f ea fa 18   6?br.l..jR.K....
    00b0 - 30 4d 31 41 26 d5 7f d8-f2 29 0d 64 ff 7b 9c 91   0M1A&....).d.{..
    00c0 - 2d 61 98 0a d9 be d5 0e-5c c1 b7 d9 4a d8 72 94   -a......\...J.r.
    00d0 - 41 63 c8 ff cd 6d 24 90-39 fa 5f d0 b6 db 08 7a   Ac...m$.9._....z

    Start Time: 1787959087
    Timeout   : 7200 (sec)
    Verify return code: 18 (self-signed certificate)
    Extended master secret: no
    Max Early Data: 0
---
read R BLOCK
---
Post-Handshake New Session Ticket arrived:
SSL-Session:
    Protocol  : TLSv1.3
    Cipher    : TLS_AES_256_GCM_SHA384
    Session-ID: B9C79CDCC844EDB3BDA4D15CB5F23365111E374EE66E2BC0B41EAB610BD42613
    Session-ID-ctx: 
    Resumption PSK: 87CDF076D97234BC7E9BC4E40F78A7B0D715A1F6091DB4771B4F5A52D770BCF38DB4378BB1E18BC469CD60EB1C9DE77C
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 300 (seconds)
    TLS session ticket:
    0000 - d3 36 31 7d b1 9c 35 85-7c 6b 2c a8 28 1c e7 d8   .61}..5.|k,.(...
    0010 - 9f 5b 48 61 d8 a1 5b 2b-42 83 09 60 4d 15 ee e0   .[Ha..[+B..`M...
    0020 - 0f 5c f1 9a bf 7f dc ad-02 d1 6e 9b 1f 01 cc aa   .\........n.....
    0030 - 39 fc 10 01 c3 ca b5 5d-e0 6e bc 53 a9 61 b6 2d   9......].n.S.a.-
    0040 - d7 d3 17 06 92 0b 8f a1-ac 3f 3d fa 2d 71 65 57   .........?=.-qeW
    0050 - 60 df 03 9b 65 48 a7 e3-0c 55 a4 30 67 d1 57 64   `...eH...U.0g.Wd
    0060 - e9 71 1a ca b6 9e 23 94-b7 c6 d5 ad a7 83 2b fc   .q....#.......+.
    0070 - 07 4a 5f f2 16 2e c3 c7-d9 b4 da 29 db 97 ed 3c   .J_........)...<
    0080 - ba aa 34 ba 00 d4 c2 77-60 80 53 e8 c6 a6 8e 59   ..4....w`.S....Y
    0090 - f6 e0 ed 0b 27 5e 7f c5-cb e6 f6 c0 14 ab e4 7f   ....'^..........
    00a0 - 86 a6 b3 dd 5d 01 15 15-c0 50 79 23 84 b9 28 2d   ....]....Py#..(-
    00b0 - 70 de 60 27 22 4c b9 fb-93 8d 7b 66 98 e9 c7 d0   p.`'"L....{f....
    00c0 - ab cf 79 cc 0b 28 1c 9c-70 5b b7 9a 77 61 b0 ab   ..y..(..p[..wa..
    00d0 - 61 9f fe fd 5f 94 3a f4-aa 5b 83 82 93 2a de e8   a..._.:..[...*..

    Start Time: 1787959087
    Timeout   : 7200 (sec)
    Verify return code: 18 (self-signed certificate)
    Extended master secret: no
    Max Early Data: 0
---

#現在のパスを入力
read R BLOCK
pbLYuZtTg4MgaqfJx8jbA9gKKGqM68A7

Correct!
kS0Hf0u5HiXFwKMKFqXvPdOTNGGa0X8V

closed
```

