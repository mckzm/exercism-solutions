package Hamming;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<hamming_distance>;

sub hamming_distance ( $strand1, $strand2 ) {
    my $len = length($strand1);
    die "strands must be of equal length" unless $len == length($strand2);

    my @s1    = split( //, $strand1 );
    my @s2    = split( //, $strand2 );
    my $diffs = 0;

    foreach ( 0 .. $len - 1 ) {
        $diffs++ if $s1[$_] ne $s2[$_];
    }

    return $diffs;
}

1;
