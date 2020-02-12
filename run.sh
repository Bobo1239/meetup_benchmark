#!/bin/bash

RUST_FLAGS="--release"

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
dmd --version | head -n 1
( cd d; dmd -O -release -inline -of=prog_dmd prog.d )
print_filesize "d/prog_dmd"
echo

echo "Building D (ldc) version..."
ldc --version | head -n 1
( cd d; ldc -O3 -release -of=prog_ldc prog.d )
print_filesize "d/prog_ldc"
echo

echo "Building D (gdc) version..."
( cd d; gdc -O3 -frelease -o prog_gdc prog.d )
print_filesize "d/prog_ldc"
echo

echo "Building AWK ^^ version..."
awk --version | head -n 1
print_filesize "awk/prog.sh"
echo

echo "Building Python ^^ version..."
python --version | head -n 1
print_filesize "py/prog.py"
echo

echo "Benching..."
( cd bench; cargo bench )
