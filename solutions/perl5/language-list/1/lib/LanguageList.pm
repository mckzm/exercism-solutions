package LanguageList;

use v5.40;

our @Languages;

sub add_language ($language) {
	push (@LanguageList::Languages, $language);
	return;
}

sub remove_language () {
	pop (@LanguageList::Languages);
	return;
}

sub first_language () {
	return $LanguageList::Languages[0];
}

sub last_language () {
	return $LanguageList::Languages[-1];
}

sub get_languages (@elements) {
	my @languages = ();
	for my $element (@elements) {
		push (@languages, $LanguageList::Languages[$element - 1]);
	}
	return @languages;
}

sub has_language ($language) {
	for my $lang (@LanguageList::Languages) {
		if ($lang eq $language) { return 1; }
	}
	return 0;
}

1;
