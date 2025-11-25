use v5.40;
use experimental qw<class>;

class RobotName;

my %names;

field $name : reader;

ADJUST {
    $self->reset_name();
}

method reset_name () {
    my $current_name = defined( $self->name() ) ? $self->name() : '';
    my $new_name     = '';
    my @uc_chars     = 'A' .. 'Z';
    my @digits       = 0 .. 9;

    while (1) {
        $new_name .= join( '', map { $uc_chars[ rand(@uc_chars) ] } 0 .. 1 );
        $new_name .= join( '', map { $digits[ rand(@digits) ] } 0 .. 2 );
        last if $new_name ne $current_name && !exists( $names{$new_name} );
    }

    $names{$new_name} = 1;
    return $name = $new_name;

}

1;
