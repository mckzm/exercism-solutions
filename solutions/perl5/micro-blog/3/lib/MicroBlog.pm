package MicroBlog;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<truncate_post>;

use constant {
    INPUT_ENCODING  => 'UTF-8',
    MAX_POST_LENGTH => 5,
};
use Encode qw<decode>;

sub truncate_post ($utf8_bytes) {
    my $decoded = decode( INPUT_ENCODING(), $utf8_bytes );
    return substr( $decoded, 0, MAX_POST_LENGTH() );
}

1;
