#!/usr/bin/python
#This program will perform the collatz conjecture

import sys
import math

maxnum= 10000
numlist = [0,0,0,0,0,0,0,0,0,0]
countlist = [0,0,0,0,0,0,0,0,0,0]
while maxnum != 0:
      x = maxnum
      duplicate = False
      smallnum = 0
      smallcount = countlist[0]
      index = 0
      count = 0
      #Loop to do collatz
      while x != 1:
            if x % 2 == 1:  #When odd number
                  x= (x * 3) + 1
            else:  #When even number
                  x= x / 2
            count+= 1
      for i in range(0, 10):
            #Updates if current sequence greater than previous sequence
            if smallcount > countlist[i]:
                  smallcount = countlist[i]
                  smallnum = i
            #Check for duplicate sequence
            if countlist[i] == count:
                  duplicate = True
                  index = i
      temp = smallnum
      #No duplicates and adds in sequence if sequence greater than current
      if count > countlist[temp] and duplicate == False:
            numlist[temp] = maxnum
            countlist[temp] = count
      #If duplicates adds the smaller number
      if maxnum < countlist[index] and duplicate == True:
            numlist[index] = maxnum
      maxnum-=1
#print "Sequence sorted by sequence length"
for j in range(0,10):
      print numlist[j], countlist[j]
print ""
print "Sequence sorted by integer size"
#Sort function that sorts based on num size
numlist.sort()
#Sort function that sorts based on sequence size
countlist.sort()
for j in range(0,10):
      print numlist[j], countlist[j]
