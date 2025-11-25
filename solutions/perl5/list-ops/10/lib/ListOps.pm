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
        sub { return ( $func->( $_[1] ) ? append( $_[0], [ $_[1] ] ) : $_[0] ) }
        ,
        [],
        $list
    );
}

sub length ($list) {
    return foldl( sub { return $_[0] + 1 }, 0, $list );
}

sub map ( $func, $list ) {
    return foldl( sub { return append( $_[0], [ $func->( $_[1] ) ] ) }, [],
        $list );
}

sub foldl ( $func, $initial, $list ) {
    $initial = $func->( $initial, $_ ) foreach @$list;
    return $initial;
}

sub foldr ( $func, $initial, $list ) {
    return foldl( $func, $initial, &reverse($list) );
}

sub reverse ($list) {
    my $len = &length($list);
    my @reversed;
    push( @reversed, @$list[ $len - $_ ] ) foreach 1 .. $len;
    return \@reversed;
}

1;
