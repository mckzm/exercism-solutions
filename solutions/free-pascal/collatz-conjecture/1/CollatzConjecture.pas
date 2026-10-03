unit CollatzConjecture;

{$mode ObjFPC}{$H+}

interface

function steps(const number : integer) : integer;

implementation

uses SysUtils;

function steps(const number : integer) : integer;
var
  current : integer;
  count : integer;
begin
  if number <= 0 then
    raise EArgumentOutOfRangeException.Create('Only positive integers are allowed');

  current := number;
  count := 0;

  while current <> 1 do
  begin
    if odd(current) then
      current := 3 * current + 1
    else
      current := current div 2;

    inc(count);
  end;

  result := count;
end;

end.