package NucleotideCount;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<count_nucleotides>;

use constant { ERROR_MSG => q(Invalid nucleotide in strand), };
use List::Util qw<any>;

sub count_nucleotides ($strand) {
    my %nucleotides = map { $_ => 0 } qw<A C G T>;

    foreach my $char ( split //, $strand ) {
        die ERROR_MSG() unless defined( $nucleotides{$char} );
        $nucleotides{$char}++;
    }

    return \%nucleotides;
}

1;
