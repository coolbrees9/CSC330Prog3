#include <stdio.h>

long long int collatz(long long int x, long long int largestVal) 
{
      if(x == 1)
            return largestVal;
      else if(x % 2 == 1) 
      {
            if(largestVal < x)
            {
                  largestVal = x;
                  return collatz(x * 3 + 1, largestVal);
            }
            collatz(x * 3 + 1, largestVal);
      }
      else 
      {
            if(largestVal < x)
            {
                  largestVal = x;
                  return collatz(x / 2, largestVal);
            }
            collatz(x / 2, largestVal);
      }
}

int main(void) 
{
      long long int largestVal = 1;
      long long int x = 11;
      largestVal = collatz(x, largestVal);
      printf("%d\n", largestVal);
      return 0;
}
