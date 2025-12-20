package WordCount;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<count_words>;

sub count_words ($sentence) {
    my $word_counts = {};
    $word_counts->{$_}++ foreach grep { $_ } split /\b{wb}\W*\b{wb}/, lc $sentence;

    return $word_counts;
}

1;
