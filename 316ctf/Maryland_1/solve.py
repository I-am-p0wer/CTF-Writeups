import hashlib

hash = "c9af96c05921d8a3ad9d033367c0c873"

with open("dictionary-list.txt", "r") as f:
    for line in f:#一行ずつ読む
        word = line.strip()#改行等を削除
        md5_hash = hashlib.md5(word.encode("utf-8")).hexdigest()
        
        if md5_hash == hash:
            print(word)
            break
