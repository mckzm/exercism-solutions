package CollatzConjecture;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<steps>;

sub steps ($number) {
	die "Only positive integers are allowed" unless $number > 0;
	return steps_rec($number, 0);
}

sub steps_rec($number, $count) {
	return $count if $number == 1;
	++$count;
	return steps_rec($number / 2, $count) if $number % 2 == 0;
	return steps_rec($number * 3 + 1, $count);
}

1;
