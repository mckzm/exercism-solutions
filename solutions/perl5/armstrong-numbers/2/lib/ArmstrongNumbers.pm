package ArmstrongNumbers;

use v5.40;
use bigint;
use List::Util qw<reduce>;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_armstrong_number>;

sub is_armstrong_number ($number) {
	my $digits = _to_digits($number, 10);
	my $len = scalar @$digits;

	return $number == reduce { $a + ($b**$len) } 0, @$digits;
}

sub _to_digits($num, $base) {
	my @digits;

	while ($num > 0) {
		push(@digits, $num % $base);
		$num = int($num / $base);
	}

	return [reverse(@digits)];
}

1;
