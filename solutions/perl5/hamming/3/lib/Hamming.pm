package Hamming;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<hamming_distance>;

sub hamming_distance ( $strand1, $strand2 ) {
    my $len = length($strand1);
    die "strands must be of equal length" unless $len == length($strand2);

    my @chars1 = split( //, $strand1 );
    my @chars2 = split( //, $strand2 );

    return scalar grep { $chars1[$_] ne $chars2[$_] } 0 .. ( $len - 1 );
}

1;
