package SecretHandshake;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<handshake>;

use constant {
    ACTIONS => [ ( 'wink', 'double blink', 'close your eyes', 'jump' ) ],
};
use List::Util qw<reduce>;

sub handshake ($number) {
    my @actions = map { $number & ( 1 << $_ ) ? ACTIONS()->[$_] : () } 0 .. 3;
    return $number & ( 1 << 4 ) ? [ reverse(@actions) ] : \@actions;
}

1;
