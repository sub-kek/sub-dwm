# dwm - dynamic window manager
# See LICENSE file for copyright and license details.

PREFIX = /usr/local

all: dwm

clean:
	rm -rf ./.cache
	rm -rf ./build
	rm -f ./compile_commands.json

cmake_generate:
	cmake -DCMAKE_BUILD_TYPE:STRING=Release -S . -B build -G Ninja
	ln -sf build/compile_commands.json ./

cmake_build:
	cmake --build ./build

dwm: clean cmake_generate cmake_build

install:
	cmake --install ./build

uninstall:
	rm -f ${PREFIX}/bin/dwm

config:
	cp src/$@.h src/$@.def.h

.PHONY: all dwm clean cmake_generate cmake_build install uninstall src/config.h
