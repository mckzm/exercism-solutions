package SecretHandshake;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<handshake>;

use integer;
use constant {
    ACTIONS => [ ("wink", "double blink", "close your eyes", "jump") ],
};

sub handshake ($number) {
    $number = int($number);
    my @actions;

    for (my $i = 0; $i < 5; ++$i) {
        if ($number & (1 << $i)) {
            push(@actions, ACTIONS()->[$i]) unless $i == 4;
            @actions = reverse(@actions) if $i == 4;
        }
    }

    return \@actions;
}

1;
