package Triangle;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_equilateral is_isosceles is_scalene>;

sub is_equilateral ($triple) {
    my ( $s1, $s2, $s3 ) = @$triple;
    my $are_equal_sides = ( $s1 == $s2 == $s3 );
    return is_triangle($triple) && $are_equal_sides;
}

sub is_isosceles ($triple) {
    my ( $s1, $s2, $s3 ) = @$triple;
    my $are_two_sides_eq = ( $s1 == $s2 || $s1 == $s3 || $s2 == $s3 );
    return is_triangle($triple) && $are_two_sides_eq;
}

sub is_scalene ($triple) {
    my ( $s1, $s2, $s3 ) = @$triple;
    my $are_sides_distinct = ( $s1 != $s2 && $s1 != $s3 && $s2 != $s3 );
    return is_triangle($triple) && $are_sides_distinct;
}

sub is_triangle($triple) {
    my $are_sides_pos = ( grep { $_ > 0 } @$triple ) == 3;
    my ( $s1, $s2, $s3 ) = @$triple;
    return
         $are_sides_pos
      && ( $s1 + $s2 >= $s3 )
      && ( $s2 + $s3 >= $s1 )
      && ( $s1 + $s3 >= $s2 );
}

1;
