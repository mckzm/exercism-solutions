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
	my $mid = int($len / 2);
	my $mid_val = @$array[$mid];

	if ($mid_val == $value) {
		return $mid;
	} elsif ($mid_val > $value) {
		return _bin_search([@$array[0..($mid - 1)]], $value);
	} else {
		my $offset = $mid + 1;
		my $res = _bin_search([@$array[$offset..($len - 1)]], $value);
		return $res == -1 ? $res : $offset + $res;
	}
}

1;
