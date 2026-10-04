unit Darts;

{$mode ObjFPC}{$H+}

interface

function score(const x : single; const y : single) : uint8;

implementation

uses SysUtils, Math; // Math is needed for `hypot`

function score(const x : single; const y : single) : uint8;
  var d : single;
  
  function isWithinCircle(const radius : single) : boolean;
  begin
    result := d <= radius;
  end;
  
begin
  d := hypot(x, y);
  result := 5 * Ord(isWithinCircle(1)) + 4 * Ord(isWithinCircle(5)) + Ord(isWithinCircle(10));
end;

end.
