package BottleSong;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<sing>;

my %numbers = (
    0  => 'no',
    1  => 'one',
    2  => 'two',
    3  => 'three',
    4  => 'four',
    5  => 'five',
    6  => 'six',
    7  => 'seven',
    8  => 'eight',
    9  => 'nine',
    10 => 'ten',
);

sub sing ( $bottles, $verses ) {
    die
      "The number of verses to sing can't be higher than the number of bottles"
      if $verses > $bottles;

    my $L3   = "And if one green bottle should accidentally fall,\n";
    my $song = q();

    while ( $verses > 0 ) {
        my $L1 = ( $numbers{$bottles} =~ s/([a-z])/\u$1/r )
          . " green bottle${ \suffix($bottles) } hanging on the wall,\n";
        my $L4 =
            "There'll be "
          . $numbers{ --$bottles }
          . " green bottle${ \suffix($bottles) } hanging on the wall.\n\n";

        $song .= $L1 x 2 . $L3 . $L4;
        --$verses;
    }

    return $song;
}

sub suffix ($bottles) {
    return $bottles != 1 ? 's' : '';
}

1;
