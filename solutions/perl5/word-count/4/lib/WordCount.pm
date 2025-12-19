package WordCount;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<count_words>;

sub count_words ($sentence) {
    my $word_counts = {};

    foreach ( split( /[^\w']/, lc($sentence) ) ) {
        next unless /\w+/;
        s/^'//;
        s/'$//;
        $word_counts->{$_}++;
    }

    return $word_counts;
}

1;
