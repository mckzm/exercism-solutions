unit ReverseString;

{$mode ObjFPC}{$H+}

interface

function reverse(const value : string) : string;

implementation

uses SysUtils;

function reverse(const value : string) : string;
var
  i, len : integer;

begin
  result := '';
  len := Length(value);
  SetLength(result, len);
  
  for i := 1 to len do
    result[i] := value[len - i + 1]
end;

end.
