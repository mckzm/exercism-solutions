unit TwoFer;

{$mode ObjFPC}{$H+}

interface

function TwoFer(const name : string) : string;

implementation

uses SysUtils;

function TwoFer(const name : string) : string;
var
  actualName : string;
begin
  actualName := name;
  if name = '' then actualName := 'you';
  result := 'One for ' + actualName + ', one for me.'
end;

end.
