package Triangle;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_equilateral is_isosceles is_scalene>;

sub is_equilateral ($triple) {
    my ( $a, $b, $c ) = @$triple;
    my $are_equal_sides = ( $a == $b == $c );
    return is_triangle($triple) && $are_equal_sides;
}

sub is_isosceles ($triple) {
    my ( $a, $b, $c ) = @$triple;
    my $are_two_sides_eq = ( $a == $b || $a == $c || $b == $c );
    return is_triangle($triple) && $are_two_sides_eq;
}

sub is_scalene ($triple) {
    my ( $a, $b, $c ) = @$triple;
    my $are_sides_distinct = ( $a != $b && $a != $c && $b != $c );
    return is_triangle($triple) && $are_sides_distinct;
}

sub is_triangle($triple) {
    my $are_sides_pos = ( grep { $_ > 0 } @$triple ) == 3;
    my ( $a, $b, $c ) = @$triple;
    return
         $are_sides_pos
      && ( $a + $b >= $c )
      && ( $b + $c >= $a )
      && ( $a + $c >= $b );
}

1;
