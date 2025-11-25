package DifferenceOfSquares;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<square_of_sum sum_of_squares difference_of_squares>;

# Faulhaber's formula for p = 1
# <https://en.wikipedia.org/wiki/Faulhaber%27s_formula>
sub square_of_sum ($number) {
    return ( ( $number * ( $number + 1 ) ) / 2 )**2;
}

# Faulhaber's formula for p = 2
sub sum_of_squares ($number) {
    return ( $number * ( $number + 1 ) * ( ( $number * 2 ) + 1 ) ) / 6;
}

sub difference_of_squares ($number) {
    return square_of_sum($number) - sum_of_squares($number);
}

1;
