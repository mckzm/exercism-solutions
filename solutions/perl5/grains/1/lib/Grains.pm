package Grains;

use v5.40;
use bigint;
use List::Util qw(reduce);

use Exporter qw<import>;
our @EXPORT_OK = qw<grains_on_square total_grains>;


sub grains_on_square ($square) {
    die 'square must be between 1 and 64' if $square < 1 or $square > 64;
    return 1 << ($square - 1);
}

sub total_grains () {
	return reduce { $a + grains_on_square($b) } 0, 1 .. 64;
}

1;
