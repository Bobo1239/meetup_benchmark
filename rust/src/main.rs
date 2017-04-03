use std::io::{self, BufRead};

fn main() {
    let stdin = io::stdin();
    let result = stdin.lock()
        .lines()
        .skip(1)
        .map(|line| {
                 let line = line.unwrap();
                 let mut cells = line.split(',').map(|cell| cell.parse::<u32>().unwrap());
                 (cells.next().unwrap(), cells.next().unwrap())
             })
        .fold((0, 0, 0),
              |acc, tuple| (acc.0 + tuple.0, acc.1 + tuple.1, acc.2 + 1));
    println!("Average {}, Sum: {}", result.0 / result.2, result.1);
}
