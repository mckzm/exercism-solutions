package Isogram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_isogram>;

sub is_isogram ($phrase) {
    my %chars;
    return $chars{$_}++ ? return 0 : next
      foreach ( lc($phrase) =~ /[[:alpha:]]/g );
    return 1;
}

1;
