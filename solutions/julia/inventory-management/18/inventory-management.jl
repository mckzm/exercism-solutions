add_items(inventory, items) = mergewith(+, inventory, create_inventory(items))
create_inventory(items) = mergewith(+, [Dict(item => 1) for item in items]...)
decrement_item_count(x, y) = max(0, x - y)
list_inventory(inventory) = filter(entry -> entry.second > 0, inventory) |> collect |> sort!
remove_item(inventory, item) = delete!(copy(inventory), item)

function decrement_items(inventory, items)
    return mergewith(
        decrement_item_count,
        inventory,
        create_inventory([item for item in items if item in keys(inventory)])
    )
end

