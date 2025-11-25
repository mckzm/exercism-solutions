package Isogram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_isogram>;

sub is_isogram ($phrase) {
    my %chars;

    foreach my $char (split(//, $phrase)) {
        my $count = ++$chars{lc($char)};
        return 0 if $count >= 2 && ($char ne ' ' && $char ne '-');
    }

    return 1;
}

1;
