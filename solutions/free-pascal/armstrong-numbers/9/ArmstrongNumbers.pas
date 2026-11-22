unit ArmstrongNumbers;

{$mode ObjFPC}{$H+}

interface

function IsArmstrongNumber(const number: qword) : boolean;

implementation

uses SysUtils, Math; // Math for **

function IsArmstrongNumber(const number: qword) : boolean;
  var
    digitCount : qword;
  
  function CountDigits(number: qword) : qword;
  begin
    if number = 0 then result := 1
    else result := Floor(Log10(number)) + 1
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
