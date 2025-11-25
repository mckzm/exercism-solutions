package ListOps;

use v5.40;

sub append ( $list1, $list2 ) {
    return [ @$list1, @$list2 ];
}

sub concat ($lists) {
    return foldl( \&append, [], $lists );
}

sub filter ( $func, $list ) {
    return foldl(
        sub ( $acc, $x ) {
            return ( $func->($x) ? append( $acc, [$x] ) : $acc );
        },
        [],
        $list
    );
}

sub length ($list) {
    return foldl( sub ( $acc, $x ) { return $acc + 1 }, 0, $list );
}

sub map ( $func, $list ) {
    return foldl( sub ( $acc, $x ) { return append( $acc, [ $func->($x) ] ) },
        [], $list );
}

sub foldl ( $func, $acc, $list ) {
    return $acc unless $list->@*;
    return foldl( $func, $func->( $acc, $list->[0] ),
        [ $list->@[ 1 .. $#$list ] ] );
}

sub foldr ( $func, $acc, $list ) {
    return foldl( $func, $acc, &reverse($list) );
}

sub reverse ($list) {
    return foldl( sub ( $acc, $x ) { return append( [$x], $acc ) }, [], $list );
}

1;
