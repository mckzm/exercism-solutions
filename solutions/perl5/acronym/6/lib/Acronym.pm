package Acronym;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<abbreviate>;

sub abbreviate ($phrase) {
	$phrase =~ s/[^0-9a-zA-Z-\s]+//g;
	my @words = split(/[ |-]/, $phrase);

	return uc(join('', map { substr($_, 0, 1) } @words));
}

1;
