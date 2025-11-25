package BinarySearch;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<binary_search>;

sub binary_search ( $array, $value ) {
	my $res = _bin_search($array, $value);

	die("value not in array") unless defined($res);
	return $res;
}

sub _bin_search($array, $value) {
	my $len = scalar @$array;
	return undef unless $len;

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
		return undef unless defined($res);
		return $offset + $res;
	}
}

1;
