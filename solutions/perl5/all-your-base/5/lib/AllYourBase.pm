package AllYourBase;

use v5.40;

use List::Util qw<all>;
use Exporter qw<import>;
our @EXPORT_OK = qw<rebase>;

my @errors = (
    'input base must be >= 2',
    'output base must be >= 2',
    'all digits must satisfy 0 <= d < input base',
);

sub rebase ( $digits, $input_base, $output_base ) {
	die $errors[0] if $input_base < 2;
	die $errors[1] if $output_base < 2;

	my $number = _from_digits($digits, $input_base);
	my $new_digits = _to_digits($number, $output_base);

	return @$new_digits ? $new_digits : [0];
}

sub _from_digits($digits, $base) {
    my $number = 0;

    for my $digit (@$digits) {
	    die $errors[2] if $digit < 0 || $digit >= $base;
	    $number = $base * $number + $digit;
    }

    return $number;
}

sub _to_digits($number, $output_base) {
	my @digits;

	while ($number > 0) {
		push(@digits, $number % $output_base);
		$number = int($number / $output_base);
	}

	return [reverse(@digits)];
}

1;
