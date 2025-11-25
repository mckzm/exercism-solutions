package AtbashCipher;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<encode_atbash decode_atbash>;

our @letters = 'a'..'z';
our $len = scalar @letters;
our %alphabet = map { $letters[$_] => $_ } 0..($len - 1);

sub encode_atbash ($phrase) {
	$phrase = lc($phrase);
	$phrase =~ s/[^[:alnum:]]//g;

	my $encoded = join('',  map {$_ =~ /[[:digit:]]/ ? $_ : @letters[-($alphabet{$_} + 1) % $len]} split(//, $phrase));
	$encoded =~ s/[[:alnum:]]{5}\K(?=[[:alnum:]])/ /sg;

	return $encoded;
}

sub decode_atbash ($phrase) {
	my $decoded = encode_atbash($phrase);
	$decoded =~ s/ //g;

	return $decoded;
}

1;
