unit Darts;

{$mode ObjFPC}{$H+}

interface

function score(const x : single; const y : single) : uint8;

implementation

uses SysUtils, Math; // Math is needed for `hypot`

function score(const x : single; const y : single) : uint8;
var r : single;
begin
  r := hypot(x, y);
  
  if r <= 1   then exit(10);
  if r <= 5   then exit(5);
  if r <= 10  then exit(1);
                   exit(0);
end;

end.
