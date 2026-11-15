unit module Leap;

sub is-leap-year ($year) is export {
    $year mod 4 == 0 && ($year mod 100 != 0 || $year mod 400 == 0)
}
