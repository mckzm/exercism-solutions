unit CollatzConjecture;

{$mode ObjFPC}{$H+}

interface

function steps(const number : integer) : integer;

implementation

uses SysUtils;

function steps(const number : integer) : integer;
begin
  if number <= 0 then
    raise EArgumentOutOfRangeException.Create('Only positive integers are allowed');

  if number = 1 then
    exit(0);

  if odd(number) then
    result := 1 + steps(3 * number + 1)
  else
    result := 1 + steps(number div 2);
end;

end.