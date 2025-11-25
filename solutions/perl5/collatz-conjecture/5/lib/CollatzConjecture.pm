package CollatzConjecture;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<steps>;

sub steps ($number) {
    die "Only positive integers are allowed" unless $number > 0;
    return steps_rec( $number, 0 );
}

sub steps_rec {
    my ( $number, $steps ) = @_;
    return $steps if $number == 1;
    ++$steps;
    $number = is_even($number) ? $number / 2 : $number * 3 + 1;
    @_      = ( $number, $steps );
    goto __SUB__;
}

sub is_even($number) {
	return $number % 2 == 0;
}

1;
