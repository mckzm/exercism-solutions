package Darts;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<score_dart>;

use constant {
    SCORING_MAP => {
        inner => {
            radius => 1.0,
            score => 10,
        },
        middle => {
            radius => 5.0,
            score => 5,
        },
        outer => {
            radius => 10.0,
            score => 1,
        },
    },
};

sub score_dart ( $x, $y ) {
    my $distance_from_origin = sqrt($x ** 2 + $y ** 2);
    my @circles = sort keys(%{ SCORING_MAP() });

    $distance_from_origin <= SCORING_MAP()->{$_}{radius} ? return SCORING_MAP()->{$_}{score} : undef foreach @circles;
    return 0;
}

1;
