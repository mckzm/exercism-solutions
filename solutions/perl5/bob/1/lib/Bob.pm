# Declare package 'Bob'
package Bob;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<hey>;

sub hey ($msg) {
	$msg =~ s/^[[:space:]]+|[[:space:]]+$//g;
	my $response;

	if ($msg =~ /\?$/) {
		$response = ($msg =~ /[A-Z]+/ && $msg eq uc($msg) ? "Calm down, I know what I'm doing!" : "Sure.");
	} elsif ($msg =~ /[A-Z]+/ && $msg eq uc($msg)) {
		$response = "Whoa, chill out!";
	} elsif ($msg =~ /^[[:space:]]*$/) {
		$response = "Fine. Be that way!";
	} else {
		$response = "Whatever.";
	}

	return $response;
}

1;
