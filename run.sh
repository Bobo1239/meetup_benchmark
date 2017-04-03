#!/bin/bash

RUST_FLAGS="--release"
D_FLAGS="-O -release"

function print_filesize {
    size=$(expr $(stat $1 --printf="%s") / 1024)
    echo "Size: $size Kb"
}

echo "Building Rust version..."
rustc -Vv
( cd rust; cargo build $RUST_FLAGS )
print_filesize "./rust/target/release/rust"
echo

echo "Building D (dmd) version..."
dmd --version
( cd d; dmd $D_FLAGS -of=prog_dmd prog.d )
print_filesize "d/prog_dmd"
echo

echo "Building D (ldc) version..."
ldc --version
( cd d; ldc $D_FLAGS -of=prog_ldc prog.d )
print_filesize "d/prog_ldc"
echo

echo "Benching..."
( cd bench; cargo bench )
