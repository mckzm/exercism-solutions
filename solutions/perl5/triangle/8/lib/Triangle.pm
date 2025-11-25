package Triangle;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_equilateral is_isosceles is_scalene>;

use List::Util qw<uniq>;

sub is_equilateral ($sides) {
    return _is_triangle($sides) && uniq(@$sides) == 1;
}

sub is_isosceles ($sides) {
    return _is_triangle($sides) && uniq(@$sides) <= 2;
}

sub is_scalene ($sides) {
    return _is_triangle($sides) && uniq(@$sides) == 3;
}

sub _is_triangle($sides) {
    my ( $x, $y, $z ) = sort @$sides;
    return ( $x > 0 ) && ( $x + $y >= $z );
}

1;
