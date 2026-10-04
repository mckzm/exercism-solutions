unit Darts;

{$mode ObjFPC}{$H+}

interface

function score(const x : single; const y : single) : uint8;

implementation

uses SysUtils, Math; // Math is needed for `ceil`

function score(const x : single; const y : single) : uint8;
begin
  case ceil(sqr(x) + sqr(y)) of
    0..1:
      exit(10);
    2..25:
      exit(5);
    26..100:
      exit(1);
  otherwise
    exit(0);
  end;
end;

end.
