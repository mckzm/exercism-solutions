package BinarySearch;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<binary_search>;

sub binary_search ( $array, $value ) {
	my $res = _bin_search($array, $value);

	die("value not in array") if ($res == -1);
	return $res;
}

sub _bin_search($array, $value) {
	my $len = scalar @$array;
	return -1 if $len == 0;

	$array = [sort { $a <=> $b } @$array];
	my $m = int($len / 2);
	my $middle = @$array[$m];

	if ($middle == $value) {
		return $m;
	} elsif ($middle > $value) {
		return _bin_search([@$array[0..($m - 1)]], $value);
	} else {
		my $res = _bin_search([@$array[($m + 1)..($len - 1)]], $value);
		return $res == -1 ? $res : $m + 1 + $res;
	}
}

1;
