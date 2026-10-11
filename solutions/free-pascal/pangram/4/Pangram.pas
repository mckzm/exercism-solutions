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
    seenLetters: set of char;

begin
  if Length(sentence) < LatinAlphabetLength then exit(false);

  seenLetters := [];
  for c in LowerCase(sentence) do
    include(seenLetters, c);

  result := ['a'..'z'] <= seenLetters;
end;

end.
