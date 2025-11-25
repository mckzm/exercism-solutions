use v5.40;
use experimental qw<class>;

class CircularBuffer;

field $capacity :reader :param;
field $read_idx;
field $write_idx;
field $in_use;
field @buffer;

ADJUST {
    $read_idx = $write_idx = $in_use = 0;
    @buffer = map { undef } ( 0 .. ($capacity - 1) );
}

method write ($item) {
    die "buffer full" if $in_use == $capacity;
    $buffer[$write_idx] = $item;
    $write_idx = ($write_idx + 1) % $capacity;
    ++$in_use;
    return;
}

method read () {
    die "buffer empty" if $read_idx == 0 and not defined($buffer[$read_idx]);
    my $item = $buffer[$read_idx];
    undef $buffer[$read_idx];
    $read_idx = ($read_idx + 1) % $capacity;
    --$in_use;
    return $item;
}

method clear () {
    $read_idx = $write_idx = $in_use = 0;
    @buffer = map { undef } ( 0 .. ($capacity - 1) );
    return;
}

method overwrite ($item) {
    return $self->write($item) unless $in_use == $capacity;
    $buffer[$read_idx] = $item;
    $read_idx = ($read_idx + 1) % $capacity;
    return;
}

1;
