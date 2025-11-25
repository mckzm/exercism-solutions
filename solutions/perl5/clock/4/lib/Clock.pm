use v5.40;
use experimental qw<class>;

class Clock;

field $hour :reader :param;
field $minute :reader :param;

use constant {
	MIN_PER_HOUR => 60,
	HOURs_PER_DAY => 24,
};

ADJUST {
	$self->_normalise_fields($hour * MIN_PER_HOUR + $minute);
}

method time () {
    return sprintf('%02d:%02d', $hour, $minute);
}

method add_minutes ($amount) {
    return $self->_normalise_fields($hour * MIN_PER_HOUR + $minute + $amount);
}

method subtract_minutes ($amount) {
    return $self->add_minutes(-$amount);
}

method _normalise_fields($total_min) {
    $hour = floor($total_min / MIN_PER_HOUR) % HOURs_PER_DAY;
    $minute = $total_min % MIN_PER_HOUR;
    return $self;
}

1;
