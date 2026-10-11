unit Darts;

{$mode ObjFPC}{$H+}

interface

function Score(const x : single; const y : single) : uint8;

implementation

uses SysUtils, Math; // Math is needed for `hypot`

function Score(const x : single; const y : single) : uint8;
var r : single;
begin
  r := Hypot(x, y);
  
  if r <= 1   then Exit(10);
  if r <= 5   then Exit(5);
  if r <= 10  then Exit(1);
                   Exit(0);
end;

end.