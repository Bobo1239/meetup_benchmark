#!/bin/bash

function print_filesize {
    size=$(expr $(stat $1 --printf="%s") / 1024)
    echo "Size: $size Kb"
}

echo "Building Rust version..."
rustc -Vv
( cd rust; cargo build --release )
print_filesize "./rust/target/release/rust"
echo

echo "Building D version..."
dmd --version
( cd d; dmd -release prog.d )
print_filesize "d/prog"
echo

echo "Benching..."
( cd bench; cargo bench )
