use v5.40;
use experimental qw<class>;

class CustomSet;
use List::Util qw<all any none uniq>;

field $elements : reader : param;

ADJUST {
    $elements = [ uniq @$elements ];
}

method is_empty () {
    return @$elements == 0;
}

method contains ($element) {
    return any { $element == $_ } @$elements;
}

method is_subset_of ($other) {
    return $self->is_empty() || all { $other->contains($_) } @$elements;
}

method is_disjoint_of ($other) {
    return none { $other->contains($_) } @$elements;
}

method is_equal_to ($other) {
    return $self->is_subset_of($other) && $other->is_subset_of($self);
}

method add ($element) {
    push( @$elements, $element ) unless $self->contains($element);
    return $self;
}

method intersection ($other) {
    return CustomSet->new(
        elements => [ grep { $other->contains($_) } @$elements ] );
}

method difference ($other) {
    return CustomSet->new(
        elements => [ grep { !( $other->contains($_) ) } @$elements ] );
}

method union ($other) {
    return CustomSet->new( elements => [ @$elements, $other->elements()->@* ] );
}

1;
