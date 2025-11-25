use v5.40;
use experimental qw<class>;
use integer;

class Clock;

field $hour :reader :param;
field $minute :reader :param;

method time () {
    my $total_min = $minute + 60 * $hour;
    my $m = $total_min % 60;
    my $h = int($total_min / 60) % 24;

    if ($h < 0 && $m < 0) {
	    $h = 23 + $h;
	    $m = 60 + $m;
    } elsif ($h < 0 && $m >=0) {
	    $h = 24 + $h;
    } elsif ($h >= 0 && $m < 0) {
	    if ($h > 0) {
		    $h -= 1;
	    } else {
		    $h = 23;
	    }
	    $m = 60 + $m;
    }

    return sprintf("%02d:%02d", $h, $m);
}

method add_minutes ($amount) {
    $minute += $amount;
    return $self;
}

method subtract_minutes ($amount) {
    $minute -= $amount;
    return $self;
}

1;
