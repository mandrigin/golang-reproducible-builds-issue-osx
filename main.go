package main

import (
	"fmt"

	"gopkg.in/olebedev/go-duktape.v3"
)

func main() {
	ctx := duktape.New()
	defer ctx.DestroyHeap()

	ctx.PevalString(`2 + 3`)
	result := ctx.GetNumber(-1)
	ctx.Pop()
	fmt.Println("duktape result is:", result)
}
