unit CollatzConjecture;

{$mode ObjFPC}{$H+}

interface

function steps(const number : integer) : integer;

implementation

uses 
  SysUtils, Math; // `Math` is needed for `ifThen`

function steps(const number : integer) : integer;
  // Tail-recursive helper, requires TAILREC to work; further see:
  // <https://forum.lazarus.freepascal.org/index.php?topic=60317.0>
  {$OPTIMIZATION TAILREC}
  function doSteps(const number : integer; count : integer) : integer;
  begin
    if number = 1 then
      exit(count);

    result := doSteps(IfThen(odd(number), 3 * number + 1, number div 2), count + 1);
  end;

begin
  if number <= 0 then
    raise EArgumentOutOfRangeException.Create('Only positive integers are allowed');
  
  result := doSteps(number, 0);
end;

end.