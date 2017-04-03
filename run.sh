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
docker run -ti dlanguage/dmd dmd --version
( cd d; docker run -v $(pwd):/work -w /work dlanguage/dmd dmd -O -release -inline -of=prog_dmd prog.d )
print_filesize "d/prog_dmd"
echo

echo "Building D (ldc) version..."
docker run -ti dlanguage/ldc ldc2 --version
( cd d; docker run -v $(pwd):/work -w /work dlanguage/ldc ldc2 -O3 -release -of=prog_ldc prog.d )
print_filesize "d/prog_ldc"
echo

echo "Benching..."
( cd bench; cargo bench )
