## [PasswordCracking]SHArkba1t_Ooh_ha_ha_2

As with the MD5 examples previously, we will continue using the same wordlist as before for these SHA1 examples.

Crack the password. That is the flag.

afafb738461b35f1eb36194c21cb463113dfced4

## Solution

```Python
import hashlib

hash = "afafb738461b35f1eb36194c21cb463113dfced4"

with open("dictionary-list.txt", "r") as f:
    for line in f:
        word = line.strip()
        sha1_hash = hashlib.sha1(word.encode("utf-8")).hexdigest()
        
        if sha1_hash == hash:
            print(word)
            break
```

## Flag

```
{Aaron}
```