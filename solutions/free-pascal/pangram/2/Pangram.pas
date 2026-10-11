unit Pangram;

{$mode ObjFPC}{$H+}

interface

function IsPangram(const sentence : string) : boolean;

implementation

uses SysUtils;

function IsPangram(const sentence : string) : boolean;
const
  LatinAlphabetLength = 26;

type
  TLatinAlphabetSet = set of 'a'..'z';

  var
    c: char;
    normalised: string;
    seenLetters: TLatinAlphabetSet;

begin
  if Length(sentence) < LatinAlphabetLength then exit(false);

  normalised := LowerCase(sentence);
  seenLetters := [];

  // O(n) single-pass linear time complexity
  for c in normalised do
    if c in ['a'..'z'] then include(seenLetters, c);

  result := (seenLetters = ['a'..'z']);
end;

end.
