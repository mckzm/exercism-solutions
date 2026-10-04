unit Darts;

{$mode ObjFPC}{$H+}

interface

function score(const x : single; const y : single) : uint8;

implementation

uses SysUtils, Math;

function score(const x : single; const y : single) : uint8;
var d: single;

function distanceToOrigin(const x : single; const y : single) : single;
  begin
    result := sqrt(sqr(x) + sqr(y));
  end;
  
begin
  d := distanceToOrigin(x, y);

  case ceil(d) of
    0..1:
      exit(10);
    2..5:
      exit(5);
    6..10:
      exit(1);
  otherwise
    exit(0);
  end;
end;

end.
