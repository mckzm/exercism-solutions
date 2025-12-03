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

sub to_rna ($dna) {
    return q() unless $dna;
    #die 'Illegal DNA strand' unless !grep { $dna =~ /$_/ } keys(%{ COMPLEMENTS_MAP() });
    return join(q(), ( map { COMPLEMENTS_MAP->{$_} } split //, $dna ));
}

1;
