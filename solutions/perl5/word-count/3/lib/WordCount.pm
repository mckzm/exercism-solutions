package WordCount;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<count_words>;

sub count_words ($sentence) {
    my $count_for = {};

    foreach ( split( /[^\w']/, lc($sentence) ) ) {
        next unless /\w+/;
        s/^'//;
        s/'$//;
        $count_for->{$_}++;
    }

    return $count_for;
}

1;
