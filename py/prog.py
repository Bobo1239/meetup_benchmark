#!/usr/bin/env python

from sys import stdin


def parse(arg, col, mode):
    assert mode in [1, 2]

    sum = 0
    for idx, line in enumerate(arg):
        if idx == 0:
            continue
        values = line.split(",")
        sum += int(values[col])
    if mode == 1:
        print(col, "[MEAN]:", sum/idx)
    elif mode == 2:
        print(col, "[SUM]:", sum)

if __name__ == "__main__":
    parse(stdin, col=1, mode=1)
