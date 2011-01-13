#!/bin/bash          
export HAXE_LIBRARY_PATH=./bin/std/
./bin/swfmill simple library.xml library.swf
./bin/haxe compile.hxml
echo SUCCESS: compiled to build/clippy.swf