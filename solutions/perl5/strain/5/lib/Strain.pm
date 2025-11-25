package Strain;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<keep discard>;

sub keep ( $input, $predicate ) {
    return [ grep { $predicate->($_) } @$input ];
}

sub discard ( $input, $predicate ) {
    return keep( $input, sub { !$predicate->(@_) } );
}

1;
