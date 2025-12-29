package SecretHandshake;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<handshake>;

use constant {
    ACTIONS => [ ( 'wink', 'double blink', 'close your eyes', 'jump' ) ],
};
use List::Util qw<reduce>;

sub handshake ($number) {
    my @actions = map { is_bit_set($number, $_) ? ACTIONS()->[$_] : () } 0 .. 3;
    return is_bit_set($number, 4) ? [ reverse(@actions) ] : \@actions;
}

sub is_bit_set ($number, $position) {
    return $number & 1 << $position;
}

1;
