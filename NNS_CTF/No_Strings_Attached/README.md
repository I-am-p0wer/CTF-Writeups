## No_Strings_Attached

Description
New to reverse engineering? This beginner challenge is an introduction to tracing the library calls a Linux program makes.

The provided x86-64 ELF asks you to guess a passphrase. The passphrase is the flag, but it is not written down anywhere in the file. Running strings on the binary only gets you guess:, correct and rejected. The program builds the real passphrase in memory first, and only then hands it to a function in the C standard library to compare against yours.

Run the program under a library call tracer such as ltrace and watch the comparison. Your goal is to read the passphrase out of the arguments the program passes to it.

## Solution

```
ltrace ./no-strings-attached 
```

```
write(1, "guess: ", 7guess: ) = 7

read(0, "\n", 127)  = 1

strcmp("","NNS{n0_str1ngs_1n_7h3_b1n4ry_bu7"...) = -78

write(1, "rejected\n", 9rejected
)  = 9
+++ exited (status 2) +++
```

## Flag

```
NNS{n0_str1ngs_1n_7h3_b1n4ry_bu7}
```