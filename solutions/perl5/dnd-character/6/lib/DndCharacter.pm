use v5.42;
use experimental qw<class>;

class DndCharacter {
    use List::Util qw<min sum>;
    use POSIX      qw<floor>;

    field $strength     : reader = ability();
    field $dexterity    : reader = ability();
    field $constitution : reader = ability();
    field $intelligence : reader = ability();
    field $wisdom       : reader = ability();
    field $charisma     : reader = ability();
    field $hitpoints    : reader = 10 + __CLASS__->modifier($constitution);

    sub ability {
        my @rolls = map { int( rand(6) ) + 1 } 1 .. 4;
        return sum(@rolls) - min(@rolls);
    }

    sub modifier {
        my ( $self, $n ) = @_;
        return floor( ( $n - 10 ) / 2 );
    }
}

1;
