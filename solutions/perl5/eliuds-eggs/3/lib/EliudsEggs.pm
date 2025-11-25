package EliudsEggs;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<egg_count>;

sub egg_count ($number) {
    return count_bits( $number, 0 );
}

sub count_bits {
    my ( $number, $bits ) = @_;
    return $bits unless $number;

    @_ = ( $number >> 1, $bits += $number & 1 );
    goto __SUB__;
}

1;
