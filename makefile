
ifeq ($(OS),Windows_NT)
	MK = @if not exist "$(@D)" mkdir "$(@D)"
else
	MK = @mkdir -p "$(@D)"
endif


all: build/index.html

build/index.html: build/lib.wasm
	$(MK)
	emcc src/main.cpp -O3 -sMAIN_MODULE=2 -o build/index.html build/lib.wasm

build/lib.wasm:
	$(MK)
	emcc src/lib.cpp -O3 -o build/lib.wasm -sSIDE_MODULE
