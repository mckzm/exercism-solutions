unit Pangram;

{$mode ObjFPC}{$H+}

interface

function IsPangram(const sentence : string) : boolean;

implementation

uses SysUtils;

function IsPangram(const sentence : string) : boolean;
const
  LatinAlphabetLength = 26;

  var
    c: char;
    normalised: string;

begin
  if Length(sentence) < LatinAlphabetLength then exit(false);

  normalised := LowerCase(sentence);

  // Readable but with O(n) linear time complexity
  for c := 'a' to 'z' do
    if Pos(c, normalised) = 0 then exit(false);

  result := true
end;

end.
