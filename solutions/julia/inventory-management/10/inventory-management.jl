create_inventory(items) = add_items(Dict(), items)
list_inventory(inventory) = filter(item -> item.second > 0, inventory) |> collect |> sort
remove_item = delete!

function add_items(inventory, items)
    foreach(item -> inventory[item] = get(inventory, item, 0)  + 1, items)
    return inventory
end

function decrement_items(inventory, items)
    for item in items
        if haskey(inventory, item) && inventory[item] > 0
            inventory[item] -= 1
        end
    end

    return inventory
end

