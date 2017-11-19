#!/usr/bin/perl
#This program will perform the collatz conjecture

use POSIX;

$max = 5000000000;
$largest = 1;
$largecount = 1;
for($i = 2; $i < $max; $i++)
{
      $count = 0;
      $x = $i;
      while($x > 1)
      {
            if($x % 2 == 1)  #Odd number
            {
                  $x = ($x * 3) + 1;
            }
            else  #Even number
            {
                  $x = $x / 2;
            }
            $count++;
      }
      if($count > $largecount)
      {
            $largecount = $count;
            $largest = $i;
      }
      print("$largest   $largecount\n");
}
