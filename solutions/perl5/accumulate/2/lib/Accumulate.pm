package Accumulate;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<accumulate>;

sub accumulate ( $list, $func ) {
	my @ret;
	push(@ret, $func->($_)) for @$list;
	return \@ret;
}

1;
