create_inventory(items) = add_items(Dict(), items)

function add_items(inventory, items)
    for item in items
        inventory[item] = 1 + (haskey(inventory, item) ? inventory[item] : 0)
    end

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

remove_item = delete!

list_inventory(inventory) = filter(item -> item.second > 0, inventory) |> collect |> sort
