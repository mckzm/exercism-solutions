package WordCount;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<count_words>;

sub count_words ($sentence) {
    my $count_for = {};

    foreach my $word ( split( /[^\w']/, lc($sentence) ) ) {
        next unless $word =~ /\w+/;
        $word             =~ s/^'//;
        $word             =~ s/'$//;
        $count_for->{$word}++;
    }

    return $count_for;
}

1;
