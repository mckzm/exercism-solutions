package BookingUpForBeauty;

use v5.40;

use Time::Piece;

use Exporter qw(import);
our @EXPORT_OK = qw(
    appointment_has_passed
    is_afternoon_appointment
    describe_appointment
);

my $STRPTIME_FORMAT = '%Y-%m-%d' . 'T' . '%H:%M:%S';

sub _parse_datetime ($date_string) {
    return Time::Piece->strptime($date_string, $STRPTIME_FORMAT);
}

sub appointment_has_passed ($date_string) {
    my $time = _parse_datetime($date_string);
    return localtime > $time;
}

sub is_afternoon_appointment ($date_string) {
    my $time = _parse_datetime($date_string);
    return $time->hour >= 12 && $time->hour < 18;
}

sub describe_appointment ($date_string) {
    my $time = _parse_datetime($date_string);
    my $description = "You have an appointment on " . $time->strftime('%m/%d/%Y %-l:%M %p');
    $description =~ s/(am|pm)/uc($1)/e;
    return $description;
}

1;
