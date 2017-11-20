--This program will perform the collatz conjecture
with Ada.Text_IO,Ada.IO_Exceptions,Ada.Integer_Text_IO,Ada.Float_Text_IO;
use Ada.Text_IO,Ada.IO_Exceptions,Ada.Integer_Text_IO,Ada.Float_Text_IO;

procedure collatz is
max : long_Integer := 5000000000;
largest : long_Integer := 1;
largecount : Integer := 1;
count : Integer;
x : long_Integer;
begin
      for i in long_Integer range 2..max loop
            count := 1;
            x := i;
            while(x > 1) loop
                  if((x mod 2) = 1) then  --Odd number
                        x := (x * 3) + 1;
                  else  --Even number
                        x := x / 2;
                  end if;
                  count := count + 1;
            end loop;
            if(count > largecount) then
                  largecount := count;
                  largest := i;
                  Put(Item=> Long_Integer'Image(largest));
                  Put("   ");
                  Put(largecount);
                  New_Line(1);
            end if;
      end loop;

end collatz;
