package Raindrops;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<raindrop>;

sub raindrop ($number) {
    my $ret = q();

    $ret .= 'Pling' if $number % 3 == 0;
    $ret .= 'Plang' if $number % 5 == 0;
    $ret .= 'Plong' if $number % 7 == 0;
    $ret .= $number unless $ret;

    return $ret;
}

1;
