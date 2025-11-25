# Declare package 'Bob'
package Bob;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<hey>;

sub hey ($msg) {
	$msg = trim($msg);
	my $is_question = $msg =~ /\?$/;
	my $is_yell = $msg =~ /[[:upper:]]+/ && $msg !~ /[[:lower:]]+/;
	my $is_silence = $msg =~ /^[[:space:]]*$/;

	if ($is_question) {
		return $is_yell ? "Calm down, I know what I'm doing!" : "Sure.";
	} elsif ($is_yell) {
		return "Whoa, chill out!";
	} elsif ($is_silence) {
		return "Fine. Be that way!";
	} else {
		return "Whatever.";
	}
}

1;
