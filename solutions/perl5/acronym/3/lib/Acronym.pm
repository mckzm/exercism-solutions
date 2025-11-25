package Acronym;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<abbreviate>;

sub abbreviate ($phrase) {
	my $acronym;

	$phrase =~ s/[^0-9a-zA-Z-\s]+//g;
	my @words = split /[ |-]/, $phrase;

	foreach (@words) {
		$acronym .= uc(substr($_, 0, 1));
	}

	return $acronym;
}

1;
