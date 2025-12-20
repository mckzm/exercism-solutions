package WordCount;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<count_words>;

sub count_words ($sentence) {
    my $word_counts = {};
    return $word_counts->{$_}++
      foreach grep { /\w/ } split /\b{wb}/, lc $sentence;
}

1;
