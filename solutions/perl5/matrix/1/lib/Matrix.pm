package Matrix;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<extract_row extract_column>;

use List::Util qw<zip>;

sub extract_row ( $matrix, $row ) {
    my @rows = map { [ split / /, $_ ] } split /\n/, $matrix;
    return $rows[$row - 1];
}

sub extract_column ( $matrix, $column ) {
    my @columns = zip map { [ split / /, $_ ] } split /\n/, $matrix;
    return @columns[$column - 1];
}

1;
