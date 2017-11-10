//This program will perform the collatz conjecture
#include <stdio.h>
#include <iostream>
using namespace std;

int collatz(long x)
{
      int count = 0;
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
            printf("X: %d Sequence: %d\n", x, count);
      }
      return count;
}
int main(int argc, char *argv[])
{
      BigInteger x;
      cout << "Enter a number... " << endl;
      cin >> x;
      collatz(x);
}
