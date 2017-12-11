#!/usr/bin/python
#This program will perform the collatz conjecture

import sys
import math

def collatz(x):
      counter = 0
      #Loop to do collatz
      while x != 1:
            if x % 2 == 1:  #When odd number
                  x= (x * 3) + 1
            else:  #When even number
                  x= x / 2
            counter+= 1
      return counter;

maxnum= 1000000000000000
csequence = []
for i in range(0, 10):
      csequence.append((i,collatz(maxnum)))
while maxnum != 0:
      x = maxnum
      duplicate = False
      smallnum = 0
      smallcount = csequence[0][1]
      index = 0
      count = collatz(x)
      for i in range(0, 10):
            #Updates if current sequence greater than previous sequence
            if smallcount > csequence[i][1]:
                  smallcount = csequence[i][1]
                  smallnum = i
            #Check for duplicate sequence
            if csequence[i][1] == count:
                  duplicate = True
                  index = i
      temp = smallnum
      #No duplicates and adds in sequence if sequence greater than current
      if count > csequence[temp][1] and duplicate == False:
            csequence[temp] = (maxnum, count)
            
      #If duplicates adds the smaller number
      if maxnum < csequence[index][0] and duplicate == True:
            csequence[index] = (maxnum, count)
      maxnum-=1
print "Sequence sorted by sequence length"
#Sort function that sorts based on sequence size
numc = sorted(csequence, key = lambda tup: tup[1])[::-1]
for j in range(0,10):
      print numc[j][0], "  ", numc[j][1]
print ""
print "Sequence sorted by integer size"
#Sort function that sorts based on num size
length = sorted(csequence, key = lambda tup: tup[0])[::-1]
for j in range(0,10):
      print length[j][0], " ", length[j][1]
