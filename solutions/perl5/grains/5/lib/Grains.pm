package Grains;

use v5.40;
use bigint;
use constant CHESSBOARD_GRAINS => (1 << 64) - 1;

use Exporter qw<import>;
our @EXPORT_OK = qw<grains_on_square total_grains>;


sub grains_on_square ($square) {
    die 'square must be between 1 and 64' unless 1 <= $square <= 64;
    return 1 << ($square - 1);
}

sub total_grains () {
	return CHESSBOARD_GRAINS;
}

1;
