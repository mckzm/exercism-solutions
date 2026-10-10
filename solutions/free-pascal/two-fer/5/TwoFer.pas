unit TwoFer;

{$mode ObjFPC}{$H+}

interface

function TwoFer(const name : string) : string;

implementation

uses SysUtils, StrUtils; // StrUtils for `ifThen`

function TwoFer(const name : string) : string;
var
  who : string;
begin
  who := ifThen(name = '', 'you', name);
  result := Format('One for %s, one for me.', [who]);
end;

end.
