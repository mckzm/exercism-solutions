unit module Leap;

sub is-leap-year (Int:D $year --> Bool:D) is export {
    $year.is-leap-year
}

use MONKEY-TYPING;

augment class Int {
    method is-leap-year(--> Bool:D) {
        self %% 4 && (self !%% 100 || self %% 400)
    }
}

