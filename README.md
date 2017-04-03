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
- The awk version is currently doing not the exact same work as the other versions.

Credits:
- Rust version by [Bobo1239](https://github.com/bobo1239)
- D version by [Stefan](https://www.meetup.com/Munich-D-Programmers/members/184727568/)
- awk version by [lindt](https://github.com/lindt)

## Results on my laptop (i7-6600U):

```
test awk   ... bench:  45,051,931 ns/iter (+/- 4,210,627)
test d_dmd ... bench:  29,407,859 ns/iter (+/- 1,739,340)
test d_ldc ... bench:   8,995,251 ns/iter (+/- 578,541)
test rust  ... bench:  11,818,265 ns/iter (+/- 1,019,974)
```

## Bonus Round

With `test.large` which is 370 Mb and not included in this repository.
Only tested with a simple `time cat test.large | <prog>` (warmed file cache).

- awk: 4.057s
- Rust: 1.054s
- D (dmd): 2.842s
- D (ldc): 0.855s
