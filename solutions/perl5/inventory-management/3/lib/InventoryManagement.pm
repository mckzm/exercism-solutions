package InventoryManagement;

use v5.40;

sub create_inventory ($items) {
    my %inventory;
    for my $item (@$items) {
	    $inventory{$item}++;
    }
    return \%inventory;
}

sub add_items ( $inventory, $items ) {
	for my $item (@$items) {
		$inventory->{$item}++;
	}
    return $inventory;
}

sub remove_items ( $inventory, $items ) {
	for my $item (@$items) {
		$inventory->{$item}-- if $inventory->{$item} > 0;
	}
    return $inventory;
}

sub delete_item ( $inventory, $item ) {
	delete($inventory->{$item});
    return $inventory;
}

1;
