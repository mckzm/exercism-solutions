package ArmstrongNumbers;

use v5.40;
use bigint;
use List::Util qw<reduce>;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_armstrong_number>;

sub is_armstrong_number ($number) {
	my $digits = _to_digits($number);
	my $len = scalar @$digits;

	return $number == reduce { $a + ($b**$len) } 0, @$digits;
}

sub _to_digits($num) {
	return [] if $num == 0;
	my $digits = _to_digits(int($num / 10));
	push(@$digits, $num % 10);
	return $digits;
}

1;
