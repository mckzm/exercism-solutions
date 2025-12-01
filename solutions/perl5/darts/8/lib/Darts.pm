package Darts;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<score_dart>;

use POSIX qw<hypot>;

sub score_dart ( $x, $y ) {
    my $h = hypot( $x, $y );
    return $h <= 1 ? 10 : $h <= 5 ? 5 : $h <= 10 ? 1 : 0;
}

1;
