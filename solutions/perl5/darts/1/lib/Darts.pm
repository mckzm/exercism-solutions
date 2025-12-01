package Darts;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<score_dart>;

sub score_dart ( $x, $y ) {
    my $d = sqrt($x ** 2 + $y ** 2);
    return do {
        if ( $d <= 1.0 ) {
            10;
        } elsif ( $d <= 5.0 )  {
            5;
        } elsif ( $d <= 10.0 ) {
            1;
        } else {
            0;
        }
    };
}

1;
