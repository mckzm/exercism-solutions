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
			if (_numeric_hashes_equal($lc_subject_char_counts, $candidate_char_counts)) {
			    push(@anagrams, $candidate);
		        }
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

sub _numeric_hashes_equal($hash1, $hash2) {
	for my $key (keys(%$hash2)) {
		if ((!exists($hash1->{$key})) || ($hash1->{$key} != $hash2->{$key})) {
				return 0;
		}
        }

	return 1;
}

1;
