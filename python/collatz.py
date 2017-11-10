#!/usr/bin/python
#This program will perform the collatz conjecture

import sys
import math

x= int(input("Enter a number... "))  #Gets user input as an int type
if x <= 1:
      print "Invalid number"
      sys.exit()
count= 0
while x != 1:
      if x % 2 == 1:  #When odd number
            x= (x * 3) + 1
      else:  #When even number
            x= x / 2
      count+= 1
      print "X = ", x, "   Sequence = ", count
