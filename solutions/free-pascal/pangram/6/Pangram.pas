unit Pangram;

{$mode ObjFPC}{$H+}

interface

function IsPangram(const sentence : string) : boolean;

implementation

uses SysUtils;

function IsPangram(const sentence : string) : boolean;
const
  LatinAlphabetLength = Ord('z') - Ord('a') + 1;

  var
    c: char;
    seenLetters: set of char;

begin
  if Length(sentence) < LatinAlphabetLength then exit(false);

  seenLetters := [];
  for c in sentence do
    include(seenLetters, Chr(Ord(c) or 32));

  result := ['a'..'z'] <= seenLetters;
end;

end.
