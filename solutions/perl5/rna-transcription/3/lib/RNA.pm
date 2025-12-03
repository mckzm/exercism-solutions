package RNA;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<to_rna>;

use constant {
    COMPLEMENTS_MAP => {
        A => 'U',
        C => 'G',
        G => 'C',
        T => 'A',
    },
};

use List::Util qw<all>;

sub to_rna ($dna) {
    return q() unless $dna;
    my @chars = split( //, $dna );
    return join( q(),
        map { COMPLEMENTS_MAP->{$_} // die "Malformed DNA strand" } @chars );
}

1;
