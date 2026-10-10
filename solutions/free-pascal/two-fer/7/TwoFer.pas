unit TwoFer;

{$mode ObjFPC}{$H+}

interface

function TwoFer(const name : string) : string;

implementation

uses SysUtils, StrUtils; // StrUtils for `ifThen`

function TwoFer(const name : string) : string;
begin
  result := Format('One for %s, one for me.', [IfThen(name = '', 'you', name)]);
end;

end.
