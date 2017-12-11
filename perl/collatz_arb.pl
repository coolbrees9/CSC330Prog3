#!/usr/bin/perl
#This program will perform the collatz conjecture

use POSIX;

$max = 1000000000000000;
$numlist = [0,0,0,0,0,0,0,0,0,0];
$countlist = [0,0,0,0,0,0,0,0,0,0];
while($max != 0)
{
      $x = $max;
      $duplicate = 0;
      $smallnum = 0;
      $smallcount = $countlist[0];
      $index = 0;
      $count = 0;
      #Loop to do collatz
      while($x != 1)
      {
            if($x % 2 == 1)
            {
                  $x = ($x * 3) + 1;
            }
            else
            {
                  $x = $x / 2;
            }
            $count++;
      }
      for($i = 0; $i < 10; $i++)
      {
            #Updates if current sequence greater than previous sequence
            if($smallcount > $countlist[$i])
            {
                  $smallcount = $countlist[$i];
                  $smallnum = $i;
            }
            #Check for duplicate sequence
            if($countlist[$i] == $count)
            {
                  $duplicate = 1;
                  $index = $i;
            }
      }
      $temp = $smallnum;
      #No duplicates and adds in sequence if sequence greater than current 
      if($count > $countlist[$temp] and $duplicate == 0)
      {
            $numlist[$temp] = $max;
            $countlist[$temp] = $count;
      }
      #If duplicates adds the smaller number
      if($max < $countlist[$index] and $duplicate == 1)
      {
                  $numlist[$index] = $max;
      }
      $max--;
}
#Method call that does bubblesort
for($x = 0; $x < 10; $x++)
{
      for($y = 0; $y < 9 - $x; $y++)
      {
            if($countlist[$y] < $countlist[$y + 1]) 
            {
                  $swapCount = $countlist[$y];
                  $countlist[$y] = $countlist[$y + 1];
                  $countlist[$y + 1] = $swapCount;
                  $swapNum = $numlist[$y];
                  $numlist[$y] = $numlist[$y + 1];
                  $numlist[$y + 1] = $swapNum;
            }
      }
}
print("Sequence sorted by sequence length\n");
for($j = 0; $j < 10; $j++)
{
      print("$numlist[$j]  $countlist[$j]\n");
}
print("\n");
#Method call that does bubblesort
bubbleSort($numlist, $countlist);
print("Sequence sorted by integer size\n");
for($j = 0; $j < 10; $j++)
{
      print("$numlist[$j]  $countlist[$j]\n");
}

sub bubbleSort  #Method that does bubblesort
{
            $numlist = $_[0];
            $countlist = $_[1];
            for($x = 0; $x < 10; $x++)
            {
                  for($y = 0; $y < 9 - $x; $y++)
                  {
                        if($numlist[$y] < $numlist[$y + 1]) 
                        {
                              $swapNum = $numlist[$y];
                              $numlist[$y] = $numlist[$y + 1];
                              $numlist[$y + 1] = $swapNum;
                              $swapCount = $countlist[$y];
                              $countlist[$y] = $countlist[$y + 1];
                              $countlist[$y + 1] = $swapCount;
                        }
                  }
            }
}