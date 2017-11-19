//This program will perform the collatz conjecture
#include <stdio.h>
#include <iostream>
using namespace std;

static void collatz(long max)
{
      long largest = 1;
      int largecount = 1;
      for(long i = 2; i < max; i++)
      {
            int count = 1;
            long x = i;
            while(x != 1)
            {
                  if(x % 2 == 1)
                  {
                        x = (x * 3) + 1;
                  }
                  else
                  {
                        x = x / 2;
                  }
                  count++;
            }
            if(count > largecount)
            {
                  largecount = count;
                  largest = i;
            }
            printf("%d   %d \n", largest, largecount);
      }
}
int main(int argc, char *argv[])
{
      long max = 5000000000;
      collatz(max);  //Calls collatz method to perform calculations
}
