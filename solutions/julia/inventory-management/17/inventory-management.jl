add_items(inventory, items) = mergewith(+, inventory, create_inventory(items))
create_inventory(items) = mergewith(+, [Dict(item => 1) for item in items]...)
list_inventory(inventory) = filter(entry -> entry.second > 0, inventory) |> collect |> sort!
remove_item(inventory, item) = delete!(copy(inventory), item)

decrement_items(inventory, items) = mergewith(decrement_helper, inventory, create_inventory([i for i in items if i in keys(inventory)]))
decrement_helper(x, y) = max(0, x - y)

