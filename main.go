package main

import (
	"fmt"
	"io"
	"os"

	"github.com/dustin/go-humanize"
)

const usage = "lim <number of bytes, default 1MB>"

func main() {
	size := int64(1 * 1024 * 1024)
	switch len(os.Args) {
	case 1:
	case 2:
		dest, err := humanize.ParseBytes(os.Args[1])
		if err != nil {
			fmt.Fprintf(os.Stderr, "unable to parse quantity: %v\n%v\n", err, usage)
			os.Exit(1)
		}
		size = int64(dest)
	default:
		fmt.Fprintf(os.Stderr, "%v\n", usage)
		os.Exit(1)
	}

	lr := io.LimitReader(os.Stdin, size)
	io.Copy(os.Stdout, lr)
}
