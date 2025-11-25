package Isogram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_isogram>;

use List::Util qw<uniq>;

sub is_isogram ($phrase) {
    return $phrase !~ /(\w).*\1/i;
}

1;
