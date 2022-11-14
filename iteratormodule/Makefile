IOS_OUT=lib/ios

ios-arm64:
	CGO_ENABLED=1 \
	GOOS=ios \
	GOARCH=arm64 \
	SDK=iphoneos \
	CC=$(shell go env GOROOT)/misc/ios/clangwrap.sh \
	CGO_CFLAGS="-fembed-bitcode" \
	go build -buildmode=c-archive -tags ios -o $(IOS_OUT)/arm64.a ./cmd/iteratormodule

ios-x86_64:
	CGO_ENABLED=1 \
	GOOS=ios \
	GOARCH=amd64 \
	SDK=iphonesimulator \
	CC=$(shell pwd)/clangwrap.sh \
	go build -buildmode=c-archive -tags ios -o $(IOS_OUT)/x86_64.a ./cmd/iteratormodule

ios: ios-arm64 ios-x86_64
	lipo $(IOS_OUT)/x86_64.a $(IOS_OUT)/arm64.a -create -output $(IOS_OUT)/libiterator.a
	cp $(IOS_OUT)/arm64.h $(IOS_OUT)/libiterator.h
	# Move output files to iOS example project source/library paths
	cp $(IOS_OUT)/libiterator.a ../lib/libiterator.a
	cp $(IOS_OUT)/libiterator.h ../src/libiterator.h
	cp ./cmd/iteratormodule/test_iterator.h ../src/test_iterator.h

