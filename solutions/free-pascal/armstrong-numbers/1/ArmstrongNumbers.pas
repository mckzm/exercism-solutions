unit ArmstrongNumbers;

{$mode ObjFPC}{$H+}

interface

function IsArmstrongNumber(const number: qword) : boolean;

implementation

uses SysUtils, Math;

function IsArmstrongNumber(const number: qword) : boolean;
  var digitCount : qword;
  
  function countDigits(number: qword) : qword;
  var count : qword;
  begin
    count := 0;
    while number mod 10 <> number do
    begin
        inc(count);
        number := number div 10;
    end;
    result := count + 1
  end;
  
  function sumDigits(number, exponent: qword) : qword;
  begin
      if number mod 10 = number then
        result := number ** exponent
      else
        result := ((number mod 10) ** exponent) + sumDigits(number div 10, exponent)
  end;
begin
  digitCount := countDigits(number);
  result := sumDigits(number, digitCount) = number
end;

end.
