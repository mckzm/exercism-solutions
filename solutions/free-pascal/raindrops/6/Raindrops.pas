unit Raindrops;

{$mode ObjFPC}{$H+}

interface

function convert(const number : integer) : string;

implementation

uses SysUtils;

type
  TRainDrop = record
    factor : integer;
    sound : string;
  end;

const
  TRainDrops : array[0..2] of TRaindrop = (
    (factor: 3; sound: 'Pling'),
    (factor: 5; sound: 'Plang'),
    (factor: 7; sound: 'Plong')
  );

var
  raindrop : TRainDrop;

function convert(const number : integer) : string;
begin
  result := '';
  
  for raindrop in TRainDrops do
    if number mod raindrop.factor = 0 then result += raindrop.sound;
  
  if Length(result) = 0 then result := IntToStr(number)
end;

end.
