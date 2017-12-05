//This program will perform the collatz conjecture
#include <stdio.h>
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

struct list
{
      long num;
      long count;
}csequence[10];

static long collatz(long x)
{
      //Loop to do collatz
      while(x != 1)
      {
            if(x % 2 == 1)
            {
                  return 1 + collatz((x * 3) + 1);
            }
            else
            {
                  return 1 + collatz(x / 2);
            }
      }
}
int main(int argc, char *argv[])
{
      long max = 10000;
      while(max != 0)
      {
            long x = max;
            bool duplicate = false;
            long smallnum = 0;
            long smallcount = csequence[0].count;
            long index = 0;
            long count = collatz(x);  //Calls collatz method to perform calculations
            for(int i = 0; i < 10; i++)
            {
                  //Updates if current sequence greater than previous sequence
                  if(smallcount > csequence[i].count)
                  {
                        smallcount = csequence[i].count;
                        smallnum = i;
                  }
                  //Check for duplicate sequence
                  if(csequence[i].count == count)
                  {
                        duplicate = true;
                        index = i;
                  }
            }
            long temp = smallnum;
            //No duplicates and adds in sequence if sequence greater than current 
            if(count > csequence[temp].count && duplicate == false)
            {
                  csequence[temp].num = max;
                  csequence[temp].count = count;
            }
            //If duplicates adds the smaller number
            if(max < csequence[index].count && duplicate == true)
                  csequence[index].num = max;
            max--;
      }
      printf("Sequence sorted by sequence length\n");
      //Sort function to sort based on sequence length 
      sort(csequence,csequence + 10,[] (list x, list y){return x.count > y.count;});
      for(int j = 0; j < 10; j++)
            printf("%d  %d \n", csequence[j].num, csequence[j].count);
      printf("\n");
      printf("Sequence sorted by integer size\n");
      //Sort function that sorts based on num size
      sort(csequence, csequence + 10, [](list x, list y){return x.num > y.num;});
      for(int j = 0; j < 10; j++)
            printf("%d  %d \n", csequence[j].num, csequence[j].count);
}
