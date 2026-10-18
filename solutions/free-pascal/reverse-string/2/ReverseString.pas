unit ReverseString;

{$mode ObjFPC}{$H+}

interface

function reverse(const value : string) : string;

implementation

uses SysUtils;

function reverse(const value : string) : string;
var
  ch : char;

begin
  result := '';
  for ch in value do
    result := ch + result
end;

end.
