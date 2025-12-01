package TwoFer;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<two_fer>;

sub two_fer ( $name = undef ) {
    return "One for ${ \( $name ? $name : q(you) ) }, one for me.";
}

1;
