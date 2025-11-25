package Anagram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<match_anagrams>;

sub match_anagrams ( $subject, $candidates ) {
	my $lc_subject = lc($subject);
	return [grep {_is_anagram_of($lc_subject, lc($_))} @$candidates];
}

sub _is_anagram_of($subject, $candidate) {
	return 0 if ($subject eq $candidate || length($subject) != length($candidate));
	return _normalise_string($subject) eq _normalise_string($candidate);
}

sub _normalise_string($string) {
	return join('', sort(split //, $string));
}

1;
