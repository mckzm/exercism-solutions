package SecretHandshake;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<handshake>;

use constant {
    ACTIONS => [ ( 'wink', 'double blink', 'close your eyes', 'jump', 'rev' ) ],
};
use List::Util qw<reduce>;

sub handshake ($number) {
    my @actions =
      grep { $_ } map { $number & ( 1 << $_ ) ? ACTIONS()->[$_] : () } 0 .. 4;
    @actions = reverse(@actions[0..$#actions - 1]) if $actions[-1] eq 'rev';
    return \@actions;
}

1;
