use v5.40;
use experimental qw<class>;

class GradeSchool;

field %students;

method add ( $student, $grade ) {
    scalar( grep { $_ eq $student } @{ $self->roster() } ) and return 0;

    push( @{ $students{$grade} }, $student );
    $students{$grade} = [ sort( @{ $students{$grade} } ) ];

    return 1;
}

method roster ( $grade = undef ) {
    return [ map { $students{$_}->@* }
        grep { $grade ? $_ == $grade : 1 } sort keys(%students) ];
}

1;
