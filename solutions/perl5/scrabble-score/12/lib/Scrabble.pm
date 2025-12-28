package Scrabble;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<scrabble_score>;

use List::Util qw<pairmap sum0>;
use constant {
    SCORES_MAP => {
        pairmap { map { $_ => $b } split /, /, $a } (
            q(A, E, I, O, U, L, N, R, S, T) => 1,
            q(D, G)                         => 2,
            q(B, C, M, P)                   => 3,
            q(F, H, V, W, Y)                => 4,
            q(K)                            => 5,
            q(J, X)                         => 8,
            q(Q, Z)                         => 10,
        )
    },
};

sub scrabble_score ($word) {
    return sum0 map { SCORES_MAP()->{$_} } split( //, uc $word );
}

1;
