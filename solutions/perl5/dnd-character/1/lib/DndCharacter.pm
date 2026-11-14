use v5.42;
use experimental qw<class>;

class DndCharacter {
    use List::Util qw<min sum>;
    use POSIX qw<floor>;

    field $strength :reader = __CLASS__->ability();
    field $dexterity :reader = __CLASS__->ability();
    field $constitution :reader = __CLASS__->ability();
    field $intelligence :reader = __CLASS__->ability();
    field $wisdom :reader = __CLASS__->ability();
    field $charisma :reader = __CLASS__->ability();
    field $hitpoints :reader = 10 + __CLASS__->modifier($constitution);
    
    sub ability($class) {
        my @rolls;
        
        push(@rolls, int(rand(6)) + 1) foreach 0..3;
        return sum(@rolls) - min(@rolls);
    }
    
    sub modifier($class, $n) {
        return floor(($n - 10) / 2);
    }
}

1;
