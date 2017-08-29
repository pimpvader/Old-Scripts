#!/usr/bin/python

for line in open("a.txt"):
    last=line
print last

last_line = file("a.txt", "r").readlines()[-1]

print last_line
