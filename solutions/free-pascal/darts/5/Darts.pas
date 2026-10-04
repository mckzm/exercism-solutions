unit Darts;

{$mode ObjFPC}{$H+}

interface

function score(const x : single; const y : single) : uint8;

implementation

uses SysUtils, Math; // Math is needed for `ceil`

function score(const x : single; const y : single) : uint8;
var
  d : single;
begin
  d := hypot(x, y);
  
  if      d <= 1   then exit(10)
  else if d <= 5   then exit(5)
  else if d <= 10  then exit(1)
  else                  exit(0);
end;

end.
