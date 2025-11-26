package Pangram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_pangram>;

use constant {
    PAN_GRAMMA => { map { $_ => 1 } 'a' .. 'z' },
};
use List::Util qw<all>;

sub is_pangram ($text) {
    my %normalised = map { $_ => 1 } ( lc $text ) =~ /[a-z]/g;
    return all { $normalised{$_} } keys %{ PAN_GRAMMA() };
    return 
}

1;
