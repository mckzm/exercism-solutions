use v5.40;
use experimental qw<class>;

class RobotName;

our %names;

field $name : reader;

ADJUST {
    $self->reset_name();
}

method reset_name () {
    my $current_name = defined( $self->name() ) ? $self->name() : '';
    my $new_name     = '';

    while (1) {
        $new_name .= join( '', map { ( 'A' .. 'Z' )[ rand(26) ] } 0 .. 1 );
        $new_name .= join( '', map { ( 0 .. 9 )[ rand(10) ] } 0 .. 2 );
        last if $new_name ne $current_name && !exists( $names{$new_name} );
    }

    $names{$new_name} = 1;
    return $name = $new_name;

}

1;
