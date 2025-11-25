package Accumulate;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<accumulate>;

sub accumulate ( $list, $func ) {
	my @ret;

	for my $elt (@$list) {
		push(@ret, $func->($elt));
	}
	return \@ret;
}

1;
