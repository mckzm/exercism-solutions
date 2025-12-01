package TwoFer;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<two_fer>;

use constant { TWO_FER_TEMPLATE => q(One for %s, one for me.), };

sub two_fer ( $name = 'you' ) {
    return sprintf( TWO_FER_TEMPLATE(), $name );
}

1;
