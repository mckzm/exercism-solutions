package Anagram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<match_anagrams>;

sub match_anagrams ( $subject, $candidates ) {
	my $lc_subject = lc($subject);
	my @anagrams;

	OUTER: for my $candidate (@$candidates) {
		my $lc_candidate = lc($candidate);
		if (_is_anagram_of($lc_subject, $lc_candidate)) {
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

sub _numeric_hashes_equal($hash1, $hash2) {
	for my $key (keys(%$hash2)) {
		if ((!exists($hash1->{$key})) || ($hash1->{$key} != $hash2->{$key})) {
				return 0;
		}
        }

	return 1;
}

sub _is_anagram_of($subject, $candidate) {
	if ($subject eq $candidate) {
		return 0;
	} else {
		my $subject_hash = _string_to_char_counts($subject);
		my $candidate_hash = _string_to_char_counts($candidate);

		return _numeric_hashes_equal($subject_hash, $candidate_hash);
	}
}

1;
