# Declare package 'Bob'
package Bob;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<hey>;

sub hey ($msg) {
	$msg = trim($msg);

	if ($msg =~ /\?$/) {
		return ($msg =~ /[A-Z]+/ && $msg eq uc($msg) ? "Calm down, I know what I'm doing!" : "Sure.");
	} elsif ($msg =~ /[A-Z]+/ && $msg eq uc($msg)) {
		return "Whoa, chill out!";
	} elsif ($msg =~ /^[[:space:]]*$/) {
		return "Fine. Be that way!";
	} else {
		return "Whatever.";
	}
}

1;
