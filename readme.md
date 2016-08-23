# lim

this is a simple cli to limit a stream of bytes by a certain number.


## installation

use `go get` to install:

    go get mcquay.me/lim


## example usage

if you install the trash utility:

    go install mcquay.me/trash

then pipe its output:

```bash
$ trash | lim > trash.dat
$ ls -lah trash.dat
-rw-r--r--  1 sm  staff   1.0M Aug 22 18:28 trash.dat

$ trash | lim 1gi > trash.dat
$ ls -lah trash.dat
-rw-r--r--  1 sm  staff   1.0G Aug 22 18:28 trash.dat
```
