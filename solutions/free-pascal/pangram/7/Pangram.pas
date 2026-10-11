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
    // Or `Chr(Ord(c) or 32)` for greater speed, as`LowerCase`
    // doesn't seem to be an intrinsic - on x86_64 FPC emits
    // `call SYSTEM_$$_LOWERCASE$CHAR$$CHAR`.
    include(seenLetters, LowerCase(c));

  result := ['a'..'z'] <= seenLetters;
end;

end.
