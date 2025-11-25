package Leap;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_leap_year>;

sub is_leap_year ($year) {
    if ($year % 4 == 0) {
        if ($year % 100 == 0) {
            return $year % 400 == 0;
        } else {
            return 1;
        }
    }

    return 0;
}

1;
