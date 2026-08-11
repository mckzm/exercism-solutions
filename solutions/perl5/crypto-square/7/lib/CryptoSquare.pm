package CryptoSquare;

use v5.42;

use Exporter qw<import>;
our @EXPORT_OK = qw<cipher>;

use List::Util qw<reduce>;
use POSIX qw<ceil>;

sub cipher ($plaintext) {
    my $normalised = lc( $plaintext =~ s/[[:^alnum:]]//gr );
    return q() unless $normalised;

    my $columns = ceil(sqrt(length($normalised)));
    my @chunks = map { [ split q() ] } $normalised =~ /(.{1, $columns})/g;

    my $transposed = reduce {
        $a->[$b] = join(q(), map {$_->[$b] // ' '} @chunks);
        $a;
    } [], (0..$columns - 1);

    return join( "\N{SPACE}", @$transposed );
}

1;
