#!/usr/bin/python3
from itertools import permutations
import sys
with open (sys.argv[1],"r+") as f:
    data=f.read().strip().split("\n")
    data=list(data)
    for j in range(len(data)):
         permute=list(permutations(data,r=j))
         for i in range(len(permute)):
             print("/".join(list(permute[i]))) 
