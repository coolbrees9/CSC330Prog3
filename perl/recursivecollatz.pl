#!/usr/bin/perl
#This program will perform the collatz conjecture

use POSIX;

$max = 10000;
$numlist = [0,0,0,0,0,0,0,0,0,0];
$countlist = [0,0,0,0,0,0,0,0,0,0];
while($max != 0)
{
      $x = $max;
      $duplicate = 0;
      $smallnum = 0;
      $smallcount = $countlist[0];
      $index = 0;
      $count = collatz($x);
      
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
for($j = 0; $j < 10; $j++)
{
      print("$numlist[$j]  $countlist[$j]\n");
}
#Recursive function to do collatz
sub collatz
{
      $x = $_[0];
      $counter = 0;
      while($x != 1)
      {
            if($x % 2 == 1)
            {
                  $counter = 1 + collatz(($x * 3) + 1);
            }
            else
            {
                  $counter = 1 + collatz($x / 2);
            }
      }
      return $counter;
}
