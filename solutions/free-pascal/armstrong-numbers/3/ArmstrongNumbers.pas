unit ArmstrongNumbers;

{$mode ObjFPC}{$H+}

interface

function IsArmstrongNumber(const number: qword) : boolean;

implementation

uses SysUtils, Math;

function IsArmstrongNumber(const number: qword) : boolean;
  var
    digitCount : qword;
  
  function CountDigits(number: qword) : qword;
  var
    count : qword;

  begin
    count := 0;
    while number mod 10 <> number do
    begin
        inc(count);
        number := number div 10;
    end;
    result := count + 1
  end;
  
  function SumDigits(number, exponent: qword) : qword;
  begin
      if number mod 10 = number then
        result := number ** exponent
      else
        result := ((number mod 10) ** exponent) + SumDigits(number div 10, exponent)
  end;
  
begin
  digitCount := CountDigits(number);
  result := SumDigits(number, digitCount) = number
end;

end.
