package ReverseString;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<str_reverse>;

sub str_reverse ($text) {
    my @glyphs = $text =~ /\X/g;
    return join( '', @glyphs[ map { $#glyphs - $_ } 0 .. $#glyphs ] );
}

1;
