package ListOps;

use v5.40;

sub append ( $list1, $list2 ) {
    return [ @$list1, @$list2 ];
}

sub concat ($lists) {
    return foldl(\&append, [], $lists);
}

sub filter ( $func, $list ) {
    my @filtered;
    foreach (@$list) {
	    push(@filtered, $_) if $func->($_);
    }
    return \@filtered;
}

sub length ($list) {
    return scalar(@$list);
}

sub map ( $func, $list ) {
    my @mapped;
    push(@mapped, $func->($_)) foreach $list->@*;
    return \@mapped;
}

sub foldl ( $func, $initial, $list ) {
    foreach ($list->@*) {
	    $initial = $func->($initial, $_);
    }
    return $initial;
}

sub foldr ( $func, $initial, $list ) {
    my @reversed = reverse($list->@*);
    return foldl($func, $initial, \@reversed);
}

sub reverse ($list) {
    my @reversed;
    foreach ($list->@*) {
	    unshift(@reversed, $_)
    }
    return \@reversed;
}

1;
