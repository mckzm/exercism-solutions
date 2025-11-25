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

sub foldl ( $func, $initial, $list ) {
    $initial = $func->( $initial, $_ ) foreach @$list;
    return $initial;
}

sub foldr ( $func, $initial, $list ) {
    return foldl( $func, $initial, &reverse($list) );
}

sub reverse ($list) {
    return foldl( sub ( $acc, $x ) { return append( [$x], $acc ) }, [], $list );
}

1;
