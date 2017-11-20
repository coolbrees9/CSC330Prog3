#!/usr/bin/python
#This program will perform the collatz conjecture

import sys
import math

maxnum= 10000000
largest= 1
largecount= 1
for i in range(2, maxnum):
      x= i
      count= 1
      while x != 1:
            if x % 2 == 1:  #When odd number
                  x= (x * 3) + 1
            else:  #When even number
                  x= x / 2
            count+= 1
      if count > largecount:
            largecount= count
            largest= i
            print largest, "   ", largecount
