package ReverseString;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<str_reverse>;

sub str_reverse ($text) {
    my @glyphs = $text =~ /\X/g;
    my @reversed_glyphs = @glyphs[ map { $#glyphs - $_ } 0..$#glyphs ];
    return join('', @reversed_glyphs);
}

1;
