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
    seenLetters: set of char;

begin
  if Length(sentence) < LatinAlphabetLength then exit(false);

  normalised := LowerCase(sentence);
  seenLetters := [];

  for c in normalised do
    include(seenLetters, c);

  result := ['a'..'z'] <= seenLetters;
end;

end.
