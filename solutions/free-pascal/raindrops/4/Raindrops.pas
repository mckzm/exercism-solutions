unit Raindrops;

{$mode ObjFPC}{$H+}

interface

function convert(const number : integer) : string;

implementation

uses SysUtils;

function convert(const number : integer) : string;
begin
  result := '';
  
  if number Mod 3 = 0 then result += 'Pling';
  if number Mod 5 = 0 then result += 'Plang';
  if number Mod 7 = 0 then result += 'Plong';
  
  if Length(result) = 0 then result := IntToStr(number)
end;

end.
