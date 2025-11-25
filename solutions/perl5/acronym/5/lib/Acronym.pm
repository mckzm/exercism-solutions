package Acronym;

use v5.40;
use List::Util qw<reduce>;

use Exporter qw<import>;
our @EXPORT_OK = qw<abbreviate>;

sub abbreviate ($phrase) {
	$phrase =~ s/[^0-9a-zA-Z-\s]+//g;
	my @words = split(/[ |-]/, $phrase);

	return uc(reduce { $a . first($b) } '', @words);
}

sub first($str) {
	return substr($str, 0, 1);
}

1;
