This is a benchmark between multiple programs doing the task specified
[here](https://github.com/d-muc/clean-code-competition17/tree/master/task1) (without
file and argument parsing).

Executing `run.sh` builds the programs (with release profile) and then benchmarks them
with Rust's integrated bencher.

As Rust's integrated bencher is unstable, a nightly toolchain is required. Recommended
installation method is obtaining [rustup.rs](https://rustup.rs/) (a Rust toolchain manager) and
running `rustup override add nightly` in this directory.

More versions are welcome! Just send a pull request. I can take care of adding it to the benchmark.

Notes:
- The awk and Python versions are currently doing not the exact same work as the other versions.

Credits:
- Rust version by [Bobo1239](https://github.com/bobo1239)
- D version by [Stefan](https://github.com/lindt)
- awk version by [Fabian](https://github.com/fstab)
- Python version by [Simon](https://github.com/s1hofmann) (modified by [lindt](https://github.com/lindt))

## Results on my laptop (i7-6600U):

```
test awk   ... bench:  44,181,760 ns/iter (+/- 1,710,389)
test d_dmd ... bench:  29,050,515 ns/iter (+/- 729,064)
test d_ldc ... bench:   8,891,791 ns/iter (+/- 319,921)
test py    ... bench:  97,129,528 ns/iter (+/- 2,060,208)
test rust  ... bench:  11,591,400 ns/iter (+/- 322,248)
```

## Bonus Round

With `test.large` which is 370 Mb and not included in this repository.
Only tested with a simple `time cat test.large | <prog>` (warmed file cache).

- awk: 4.078s
- Rust: 1.039s
- D (dmd): 2.793s
- D (ldc): 0.893s
- Python: 7.405s
