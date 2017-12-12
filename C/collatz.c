#include <stdio.h>

long long int collatz(long long int x, long long int largestVal) 
{
      while(x != 1) 
      {
            if(x % 2 == 1) 
            {
                  x = x * 3 + 1;
                  if(largestVal < x)
                        largestVal = x;
            }
            else 
            {
                  x = x / 2;
            }
      }
      return largestVal;
}

int main(void) 
{
      long largestVal = 0;
      long x = 11;
      largestVal = collatz(x, largestVal);
      printf("%d\n", largestVal);
      return 0;
}
