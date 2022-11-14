# Swift Iterator looping in C code

This is a demonstration for how to create an iterator object in Swift and loop through its contents in C/C++.

## Requirements

1. Xcode
2. Cocoapods:

Install cocoapods on your Mac via 
* Ruby: `$ sudo gem install cocoapods`
* Homebrew: `$ brew install cocoapods`
3. Tested on `go` version 1.19. Could work on earlier versions.

## Project Division

1. `go` module

The `go` module is in the `iteratormodule` folder. The source files for the compiled `cgo` library are in `iteratormodule/cmd/iteratormodule/*`. This is where the C iterator function callbacks are passed to and executed.

2. `iOS project`

The iOS app can be found inside the `Example` folder and can be opened in Xcode by double clicking `IteratorPodTest.xcworkspace`.

## Running

1. Compile `cgo` module
```bash
$ cd iteratormodule
$ make ios
```
* This would compile the `cgo` module and move the library and header files to folders the iOS project will look in for installing the `cgo` library.

2. Running the `iOS` project.
```bash
$ cd Example
$ pod install
```
This would install the compiled libraries from step 1. You can run the project from simulator by double clicking `Example/IteratorPodTest.xcworkspace` and running on Xcode simulator.
