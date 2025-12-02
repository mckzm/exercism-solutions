package Raindrops;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<raindrop>;

use List::Util qw<reduce>;

sub raindrop ($number) {
    my @raindrops = (
        !( $number % 3 ) && 'Pling',
        !( $number % 5 ) && 'Plang',
        !( $number % 7 ) && 'Plong'
    );
    return q() . ( reduce { $a . $b } @raindrops ) || $number;
}

1;
