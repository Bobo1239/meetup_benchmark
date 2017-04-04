#!/usr/bin/env python

from sys import argv

mode = {'MEAN': 1, 'SUM': 2}

def parse(arg, col, mode):
    if mode not in [1, 2]:
        return
    with open(arg, 'r') as csv_input:
        sum = 0
        first_line = csv_input.readline()
        if col > len(first_line.split(',')) - 1:
            return
        for idx, line in enumerate(csv_input.readlines()):
            if idx == 0:
                continue
            values = line.split(",")
            sum += int(values[col])
        if mode == 1:
            print(col, "[MEAN]:", sum/idx)
        elif mode == 2:
            print(col, "[SUM]:", sum)

if __name__ == "__main__":
    if len(argv) < 2:
        print("Argument error.")
        exit(-1)
    for arg in argv[2:]:
        param = arg.split('=')
        col = int(param[0])
        m = mode[param[1]]
        parse(argv[1], col, m)
