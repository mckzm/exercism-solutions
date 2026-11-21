unit DndCharacter;

{$mode ObjFPC}{$H+}

{$WARN 6058 OFF}
{$WARN 5071 OFF}

interface

type
  TCharacter = record
    strength     : integer;
    dexterity    : integer;
    constitution : integer;
    intelligence : integer;
    wisdom       : integer;
    charisma     : integer;
    hitpoints    : integer;
  end;

function modifier(const score : integer) : integer;
function ability : integer;
function character : TCharacter;

implementation

uses Math;

function modifier(const score : integer) : integer;
begin
  result := (score div 2) - 5
end;

function ability : integer;
   var
     rolls : array[1..4] of integer;
     i : integer;
begin
  for i := Low(rolls) to High(rolls)
    do rolls[i] := RandomRange(1, 7);
  result := SumInt(rolls) - MinIntValue(rolls)
end;

function character : TCharacter;
begin
  result.strength := ability();
  result.dexterity := ability();
  result.constitution := ability();
  result.intelligence := ability();
  result.wisdom := ability();
  result.charisma := ability();
  result.hitpoints := 10 + modifier(result.constitution)
end;

initialization
  Randomize;

end.
