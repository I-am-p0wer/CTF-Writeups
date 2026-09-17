## Git_Is_Good

30 points Easy

The flag used to be there. But then I redacted it. Good Luck. https://mega.nz/#!3CwDFZpJ!Jjr55hfJQJ5-jspnyrnVtqBkMHGJrd6Nn_QqM7iXEuc

## Solution

解凍してflag見たがはずれ

```
# cd gitIsGood/
~/gitIsGood# ls
flag.txt
~/gitIsGood# cat flag.txt 
flag{REDACTED}
```

.git隠しフォルダがあった

```
~/gitIsGood# ls -a
.         ..        .git      flag.txt
```

git logでコミット履歴を見る。

```
git log -p
```

```
commit d10f77c4e766705ab36c7f31dc47b0c5056666b
b (HEAD -> master)
Author: LaScalaLuke <lascala.luke@gmail.com>
Date:   Sun Oct 30 14:33:18 2016 -0400

    Edited files

diff --git a/flag.txt b/flag.txt
index c5250d0..8684e68 100644
--- a/flag.txt
+++ b/flag.txt
@@ -1 +1 @@
-flag{REDACTED}
+flag{protect_your_git}

commit 6e824db5ef3b0fa2eb2350f63a9f0fdd9cc7b0b
f
Author: LaScalaLuke <lascala.luke@gmail.com>
Date:   Sun Oct 30 14:32:11 2016 -0400

    edited files

diff --git a/flag.txt b/flag.txt
new file mode 100644
index 0000000..c5250d0
--- /dev/null
+++ b/flag.txt
@@ -0,0 +1 @@
+flag{REDACTED}
```

## Flag
```
flag{protect_your_git}
```