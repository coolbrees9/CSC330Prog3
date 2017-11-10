--This program will perform the collatz conjecture
with Ada.Text_IO,Ada.IO_Exceptions,Ada.Command_Line,Ada.Integer_Text_IO,Ada.Float_Text_IO;
use Ada.Text_IO,Ada.IO_Exceptions,Ada.Command_Line,Ada.Integer_Text_IO,Ada.Float_Text_IO;

procedure collatz is
count :Integer := 0;
x : Integer;
begin
      Put_Line("Enter a number...");
      Ada.Integer_Text_IO.Get(x);  --User input is integer
      if(x <= 1) then
            Put_Line("Invalid Number");
      end if;
      while(x > 1) loop
            if((x mod 2) = 1) then  --Odd number
                  x := (x * 3) + 1;
            else  --Even number
                  x := x / 2;
            end if;
            count := count + 1;
            Put("X = ");
            Put(x);
            Put("   Sequence = ");
            Put(count);
            New_Line(1);
      end loop;

end collatz;
