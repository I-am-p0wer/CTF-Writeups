## [250pt]Acrostic

FINAL SUBMISSION WARNING
This challenge allows only 1 flag attempt. Submit only when you are sure.
A mysterious message was intercepted from the network. Something is hidden in plain sight.

Read carefully — the first letter of each line reveals the secret.

Flag format : 0xV0ID{......}

## Solution

message.txt
```
Forgotten echoes drift through the network at midnight.
Invisibly, packets cross the wire unseen.
Routing tables shift and reshape the data paths.
Silence fills the void between each transmission.
Time stamps record every byte that passes.
Signals propagate at the speed of light.
Topology defines how nodes find each other.
Encryption wraps the payload in darkness.
Persistence is the key to every challenge.
```
一行ごと読み込んで最初の文字を取得する。

```Python
flag =''
with open("message.txt", "r", errors="ignore") as f:
    for line in f:
        word = line.strip()
        #print(word[:1])
        flag += word[:1]
        
print(flag)
```

## Flag
```
0xV0ID{FIRSTSTEP}
```