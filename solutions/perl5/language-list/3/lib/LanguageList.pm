package LanguageList;

use v5.40;

our @Languages;

sub add_language ($language) {
	push(@Languages, $language);
	return;
}

sub remove_language () {
	pop(@Languages);
	return;
}

sub first_language () {
	return $Languages[0];
}

sub last_language () {
	return $Languages[-1];
}

sub get_languages (@elements) {
	my @languages = ();
	for my $element (@elements) {
		push(@languages, $Languages[$element - 1]);
	}
	return @languages;
}

sub has_language ($language) {
	for my $lang (@Languages) {
		if ($lang eq $language) { return 1; }
	}
	return 0;
}

1;
