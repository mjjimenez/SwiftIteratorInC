package main

/*
#include "test_iterator.h"

*/
import "C"
import "unsafe"
import "fmt"

//export call_go_iterator
func call_go_iterator(ctxt unsafe.Pointer, iter C.iterator, dest C.iteratorDest) {
  fmt.Println("started iterator")
  C.test_iterator(ctxt, iter, dest)
  fmt.Println("ended iterator")
}

//export print_go
func print_go() {
  fmt.Println("inside print_go")
}

func main(){}
