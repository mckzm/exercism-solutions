package EliudsEggs;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<egg_count>;

sub egg_count ($number) {
    my $bits = 0;

    while ( $number != 0 ) {
        $bits++ if $number & 1;
        $number >>= 1;
    }

    return $bits;
}

1;
