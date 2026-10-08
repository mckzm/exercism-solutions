unit TwoFer;

{$mode ObjFPC}{$H+}

interface

function TwoFer(const name : string) : string;

implementation

uses SysUtils, StrUtils; // StrUtils for `ifThen`

function TwoFer(const name : string) : string;
begin
  result := 'One for ' + ifThen(name = '', 'you', name) + ', one for me.'
end;

end.
