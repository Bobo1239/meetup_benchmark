// Disclaimer: Horrible code produced under time pressure...

use std::env;
use std::fs::File;
use std::io::{BufReader, BufRead};
use std::str::FromStr;

#[derive(Debug)]
struct Command {
    column: usize,
    op: Op,
}

#[derive(Debug)]
enum Op {
    Sum,
    Average,
}

impl FromStr for Command {
    type Err = ();
    fn from_str(input: &str) -> Result<Command, ()> {
        let mut parts = input.split('=');
        let col = parts.next()
            .unwrap()
            .parse()
            .unwrap();
        let op = match parts.next().unwrap() {
            "SUM" => Op::Sum,
            "MEAN" => Op::Average,
            _ => panic!("Op parse error!"),
        };
        Ok(Command {
               column: col,
               op: op,
           })

    }
}

fn main() {
    let mut args = env::args().skip(1);
    let file_path = args.next().expect("Missing file!");
    let mut commands: Vec<Command> = Vec::new();
    for argument in args {
        commands.push(argument.parse().unwrap());
    }

    let file = File::open(file_path).unwrap();
    let mut lines = BufReader::new(file).lines();

    let first_line = lines.next().unwrap().unwrap();
    let columns = first_line.split(',').count();
    let mut column_sums: Vec<u32> = Vec::with_capacity(columns);
    column_sums.resize(columns, 0);

    let mut rows = 0;
    for line in lines {
        rows += 1;
        let line = line.unwrap();
        let fields = line.split(',');
        for (col, field) in fields.enumerate() {
            column_sums[col] += field.parse().expect("ParseError");
        }
    }

    for command in commands {
        let col = command.column;
        match command.op {
            Op::Sum => {
                println!("{}[SUM]: {}", col - 1, column_sums[col - 1]);
            }
            Op::Average => {
                println!("{}[MEAN]: {}",
                         col - 1,
                         column_sums[col - 1] as f64 / rows as f64);
            }
        }
    }
}
