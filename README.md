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

## Results on my workstation (AMD Ryzen 9 3950X):

```
test awk   ... bench:  34,227,744 ns/iter (+/- 2,163,885)
test d_dmd ... bench:  18,091,353 ns/iter (+/- 1,489,948)
test d_gdc ... bench:  10,590,457 ns/iter (+/- 1,629,433)
test d_ldc ... bench:  10,381,016 ns/iter (+/- 1,387,163)
test py    ... bench:  56,565,560 ns/iter (+/- 6,188,942)
test rust  ... bench:   9,189,600 ns/iter (+/- 1,224,436)
```

## Bonus Round

With `test.large` which is 389 MB and not included in this repository.
Only tested with a simple `time cat test.large | <prog>` (warmed file cache).

- awk: 2.747s
- Rust: 0.665s
- D (dmd): 1.632s
- D (ldc): 0.670s
- D (gdc): 0.806s
- Python: 4.086s
