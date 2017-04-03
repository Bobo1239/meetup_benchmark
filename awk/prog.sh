#!/bin/sh

awk -F, '{s+=$2; n+=1}END{print "SUM: ", s, "MEAN: ", s/n}'
