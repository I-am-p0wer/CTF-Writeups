## Open_Secret

Description

New to reverse engineering? This beginner challenge is an introduction to tracing the system calls a Linux program makes.

The provided x86-64 ELF wants a license file before it will do anything, but it will not tell you which one. The path is not written down in the binary either and running strings on it only gets you no license. The program builds the path in memory first, and only then asks the kernel to open it.

This one talks to the kernel directly, so a library call tracer has nothing to show you. Run the program under a system call tracer such as strace instead, watch the call that opens the file, and read the path out of its arguments. Your goal is to create the file it is looking for and run the program again.

## Solution

```
$ strace ./open-secret 
```

```
mkdir -p /home/ubuntu/.config/nns/
```

```
touch /home/ubuntu/.config/nns/key
```

```
$ strace ./open-secret 
execve("./open-secret", ["./open-secret"], 0x7ffd04958a80 /* 24 vars */) = 0
openat(AT_FDCWD, "/home/ubuntu/.config/nns/key", O_RDONLY) = 3
close(3)                                = 0
write(1, "NNS{7h3_p47h_w4s_h1dd3n_bu7_s7r4"..., 49NNS{7h3_p47h_w4s_h1dd3n_bu7_s7r4c3_s4w_7h3_0p3n}
) = 49
exit(0)                                 = ?
+++ exited with 0 +++
```

## Flag
```
NNS{7h3_p47h_w4s_h1dd3n_bu7_s7r4c3_s4w_7h3_0p3n}
```