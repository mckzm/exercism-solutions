package AtbashCipher;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<encode_atbash decode_atbash>;

our %alphabet;
@alphabet{'a'..'z'} = reverse('a'..'z');
@alphabet{0..9} = 0..9;

sub encode_atbash ($phrase) {
	$phrase = lc($phrase);
	$phrase =~ s/[^[:alnum:]]//g;

	my $encoded = join('',  map { $alphabet{$_} } split(//, $phrase));
	$encoded =~ s/[[:alnum:]]{5}\K(?=[[:alnum:]])/ /sg;

	return $encoded;
}

sub decode_atbash ($phrase) {
	my $decoded = encode_atbash($phrase);
	$decoded =~ s/ //g;

	return $decoded;
}

1;
