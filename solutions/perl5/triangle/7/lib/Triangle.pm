package Triangle;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_equilateral is_isosceles is_scalene>;

use List::Util qw<uniq>;

sub is_equilateral ($sides) {
    my ( $s1, $s2, $s3 ) = @$sides;
    my $are_equal_sides = ( $s1 == $s2 && $s2 == $s3 );
    return _is_triangle($sides) && $are_equal_sides;
}

sub is_isosceles ($sides) {
    my ( $s1, $s2, $s3 ) = @$sides;
    my $are_two_sides_eq = ( $s1 == $s2 || $s1 == $s3 || $s2 == $s3 );
    return _is_triangle($sides) && $are_two_sides_eq;
}

sub is_scalene ($sides) {
    my ( $s1, $s2, $s3 ) = @$sides;
    my $are_sides_distinct = ( $s1 != $s2 && $s1 != $s3 && $s2 != $s3 );
    return _is_triangle($sides) && $are_sides_distinct;
}

sub _is_triangle($sides) {
    my ( $s1, $s2, $s3 ) = @$sides;
    return
         ( $s1 + $s2 > $s3 )
      && ( $s2 + $s3 > $s1 )
      && ( $s1 + $s3 > $s2 );
}

1;
