use v5.40;
use experimental qw<class>;

class GradeSchool;

field %grades;

method add ( $student, $grade ) {
    scalar( grep { $_ eq $student } @{ $self->roster() } ) and return 0;

    push( $grades{$grade}->@*, $student );
    $grades{$grade} = [ sort( $grades{$grade}->@* ) ];

    return 1;
}

method roster ( $grade = undef ) {
    return [
        map  { $grades{$_}->@* }
        grep { $grade ? $_ == $grade : 1 } sort( keys(%grades) )
    ];
}

1;
