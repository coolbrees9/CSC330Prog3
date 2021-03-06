//This program will perform the collatz conjecture

using System;
using System.Numerics;
using System.Linq;

public class CollatzConjecture
{
      public struct list
      {
            public BigInteger num = new BigInteger(0);
            public BigInteger count = new BigInteger(0);
      }

      static public void Main()
      {
            BigInteger max = new BigInteger(10000);
            BigInteger csequence = new BigInteger(list[10]);
            while(max != 0)
            {
                  BigInteger x = new BigInteger(max);
                  bool duplicate = false;
                  BigInteger smallnum = new BigInteger(0);
                  BigInteger smallcount = new BigInteger(csequence[0].count);
                  BigInteger index = new BigInteger(0);
                  BigInteger count = new BigInteger(collatz(x));  //Calls collatz method
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
            Console.WriteLine("Sequence sorted by sequence length");
            //Sort function to sort based on sequence length 
            csequence = csequence.OrderBy(n => n.count).ToArray();
            for(int j = 0; j < 10; j++)
                  Console.WriteLine(csequence[j].num + "  " + csequence[j].count);
            Console.WriteLine();
            Console.WriteLine("Sequence sorted by integer size");
            //Sort function that sorts based on num size
            csequence = csequence.OrderBy(n => n.num).ToArray();
            for(int j = 0; j < 10; j++)
                  Console.WriteLine(csequence[j].num + "  " + csequence[j].count);
      
      }
      static long collatz(long x)
      {
            long counter = 0;
            //Loop to do collatz
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
                  counter++;
            }
            return counter;
      }
}
