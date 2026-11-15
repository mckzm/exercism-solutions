unit module Leap;

sub is-leap-year (Int:D $year --> Bool:D) is export {
    $year %% 4 && ($year !%% 100 || $year %% 400)
}