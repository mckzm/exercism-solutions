unit DifferenceOfSquares;

{$mode ObjFPC}{$H+}

interface

function SquareOfSum(number : longint) : longint;
function SumOfSquares(number : longint) : longint;
function DifferenceOfSquares(number : longint) : longint;

implementation

uses SysUtils;

function SquareOfSum(number : longint) : longint;
begin
  result := sqr((number * (number + 1)) div 2)
end;

function SumOfSquares(number : longint) : longint;
begin
  result := (number * (number + 1) * (2 * number +1)) div 6
end;

function DifferenceOfSquares(number : longint) : longint;
begin
    result := SquareOfSum(number) - SumOfSquares(number)
end;

end.
