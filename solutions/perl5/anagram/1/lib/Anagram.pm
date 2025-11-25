package Anagram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<match_anagrams>;

sub match_anagrams ( $subject, $candidates ) {
	my $lc_subject = lc($subject);
	my $lc_subject_char_counts = _string_to_char_counts($lc_subject);
	my @anagrams;

	OUTER: for my $candidate (@$candidates) {
		my $lc_candidate = lc($candidate);
		if (!($lc_subject eq $lc_candidate)) {
			my $candidate_char_counts = _string_to_char_counts($lc_candidate);
			for my $key (keys(%$candidate_char_counts)) {
				if (!exists($lc_subject_char_counts->{$key}) || ($candidate_char_counts->{$key} != $lc_subject_char_counts->{$key})) {
					next OUTER;
				}
			}
			push(@anagrams, $candidate);
		}
	}
	return \@anagrams;
}

sub _string_to_char_counts($string) {
	my @chars = split(//, $string);
	my %counts;

	for my $char (@chars) {
		$counts{$char}++;
	}

	return \%counts;
}

1;
