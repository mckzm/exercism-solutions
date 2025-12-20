package Matrix;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<extract_row extract_column>;

use List::Util qw<zip>;

sub extract_row ( $matrix, $row ) {
    return _extract_rows($matrix)->[ $row - 1 ];
}

sub extract_column ( $matrix, $column ) {
    return ( zip @{ _extract_rows($matrix) } )[ $column - 1 ];
}

sub _extract_rows($matrix) {
    return [ map { [ split / / ] } split( /\n/, $matrix ) ];
}

1;
