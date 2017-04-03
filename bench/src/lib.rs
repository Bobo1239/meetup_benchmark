#![feature(test)]
extern crate test;

use std::process::{Command, Stdio};
use std::io::Write;
use test::Bencher;

static INPUT: &str = include_str!("../../test.medium");

fn run(command: &str) {
    let mut process = Command::new(command)
        .stdin(Stdio::piped())
        .stdout(Stdio::null())
        .spawn()
        .unwrap();
    process.stdin
        .as_mut()
        .unwrap()
        .write_all(INPUT.as_bytes())
        .unwrap();
    process.wait().unwrap();
}

#[bench]
fn d(b: &mut Bencher) {
    b.iter(|| { run("../d/prog"); })
}

#[bench]
fn rust(b: &mut Bencher) {
    b.iter(|| { run("../rust/target/release/rust"); })
}
