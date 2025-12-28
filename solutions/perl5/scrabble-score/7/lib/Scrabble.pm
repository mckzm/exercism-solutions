package Scrabble;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<scrabble_score>;

use List::Util qw<pairmap sum0>;
my %scores;

sub scrabble_score ($word) {
    _gen_scores();
    return sum0 map { $scores{$_} } split( //, uc $word );
}

sub _gen_scores {
    return if %scores;

    pairmap { map { $scores{$_} = $b } split /, /, $a } 
        q(A, E, I, O, U, L, N, R, S, T) => 1,
        q(D, G)                         => 2,
        q(B, C, M, P)                   => 3,
        q(F, H, V, W, Y)                => 4,
        q(K)                            => 5,
        q(J, X)                         => 8,
        q(Q, Z)                         => 10,
    ;

    return;
}

1;
