unit Darts;

{$mode ObjFPC}{$H+}

interface

function score(const x : single; const y : single) : uint8;

implementation

uses SysUtils;

function score(const x : single; const y : single) : uint8;
var d: single;

function distanceToOrigin(const x : single; const y : single) : single;
  begin
    result := sqrt(sqr(x) + sqr(y));
  end;
  
begin
  d := distanceToOrigin(x, y);

  if d > 10 then exit(0);
  if (d > 5) and (d <= 10) then exit(1);
  if (d > 1) and (d <= 5) then exit(5);
  if d <= 1 then exit(10);
end;

end.
