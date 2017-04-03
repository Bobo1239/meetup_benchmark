import std.algorithm, std.conv, std.range, std.stdio, std.typecons;

void main()
{
    const result = stdin
        .byLine
        .dropOne
        .map!(line => line.splitter(",").map!(cell => cell.to!uint))
        .map!(line => tuple(line.front, line.dropOne.front, 1))
        .fold!((a, b) => tuple(a[0] + b[0], a[1] + b[1], a[2] + b[2]));

    writefln("Average %s, Sum: %s", result[0] / result[2], result[1]);
}
