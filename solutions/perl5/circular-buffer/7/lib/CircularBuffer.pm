use v5.40;
use experimental qw<class>;

class CircularBuffer;

field $capacity : reader : param;
field $read_idx;
field $write_idx;
field $in_use;
field @buffer;

ADJUST {
    $self->clear();
}

method write ($item) {
    die "buffer full" if $self->is_full();
    $buffer[$write_idx] = $item;
    $write_idx = $self->incr_idx($write_idx);
    ++$in_use;
    return;
}

method read () {
    die "buffer empty" if $self->is_empty();
    my $item = $buffer[$read_idx];
    undef $buffer[$read_idx];
    $read_idx = $self->incr_idx($read_idx);
    --$in_use;
    return $item;
}

method clear () {
    $read_idx = $write_idx = $in_use = 0;
    @buffer   = map { undef } ( 0 .. ( $capacity - 1 ) );
    return;
}

method overwrite ($item) {
    return $self->write($item) unless $self->is_full();
    $buffer[$read_idx] = $item;
    $read_idx = $self->incr_idx($read_idx);
    return;
}

method is_full () {
    return $in_use == $capacity;
}

method is_empty () {
    $in_use == 0;
}

method incr_idx($idx) {
    return ( $idx + 1 ) % $capacity;
}

1;
