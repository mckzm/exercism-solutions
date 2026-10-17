unit Darts;

{$mode ObjFPC}{$H+}

interface

function Score(const x : single; const y : single) : uint8;

implementation

uses SysUtils, Math; // Math is needed for `hypot`

type
  TTargetCircle = record
    radius : single;
    score : uint8;
  end;

const
  Target : array[0..2] of TTargetCircle = (
    (radius: 1.0; score: 10),
    (radius: 5.0; score: 5),
    (radius: 10.0; score: 1)
  );

function Score(const x : single; const y : single) : uint8;
var
  r : single;
  circle : TTargetCircle;

begin
  r := Hypot(x, y);

  for circle in Target do
    if r <= circle.radius then Exit(circle.score);
  
  Exit(0);
end;

end.