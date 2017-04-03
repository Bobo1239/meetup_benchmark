This is a benchmark between multiple programs doing the task specified
[here](https://github.com/d-muc/clean-code-competition17/tree/master/task1) (without
file and argument parsing).

Executing `run.sh` builds the programs (with release profile) and then benchmarks them
with Rust's integrated bencher.

As Rust's integrated bencher is unstable, a nightly toolchain is required. Recommended
installation method is obtaining [rustup.rs](https://rustup.rs/) (a Rust toolchain manager) and
running `rustup override add nightly` in this directory.

More versions are welcome! Just send a pull request. I can take care of adding it to the benchmark.

Credits:
- Rust version by me (Bobo1239)
- D version by [Stefan](https://www.meetup.com/Munich-D-Programmers/members/184727568/)

## Results on my laptop (i7-6600U):

```
test d_dmd ... bench:  41,720,325 ns/iter (+/- 2,205,311)
test d_ldc ... bench:  14,314,630 ns/iter (+/- 2,000,920)
test rust  ... bench:  11,573,562 ns/iter (+/- 864,141)
```

## Bonus Round

With `test.large` which is 370 Mb and not included in this repository.
Only tested with a simple `time cat test.large | <prog>` (warmed file cache).

- Rust: 1.168s
- D (dmd): 4.952s
