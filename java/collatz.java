//Program that calculates the Collatz conjecture
import java.util.*;
import java.io.*;
import java.math.BigInteger;
public class collatz
{
      public static void main(String[] args)
      {
            //BigInteger max = new BigInteger("5000000000");
            long max = 1000000000;
            collatz(max);  //Calls collatz method to do actual calculations
      }
      static void collatz(long max)
      {
            //BigInteger i = new BigInteger();
            //BigInteger largest = new BigInteger("1");
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
                        System.out.println(largest + "   " + largecount);
                  }
            }
      }
}
