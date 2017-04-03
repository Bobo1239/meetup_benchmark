#!/bin/bash

# test.large is not in this repo due to being 371MB big; checkout out the repo of the task
# (see README) to generate one

function bench_large {
    echo "$1:"
    time cat test.large | $2
    echo
}

bench_large "awk" ./awk/prog.sh
bench_large "Rust" ./rust/target/release/rust
bench_large "D (dmd)" ./d/prog_dmd
bench_large "D (ldc)" ./d/prog_ldc
