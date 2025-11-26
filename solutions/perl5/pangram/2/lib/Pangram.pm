package Pangram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_pangram>;

use List::Util qw<all>;

sub is_pangram ($text) {
    my %pan_gramma = map { $_ => 0 } 'a' .. 'z';
    $pan_gramma{$_}++ foreach ( lc $text ) =~ /[a-z]/g;
    return all { $pan_gramma{$_} } keys %pan_gramma;
}

1;
