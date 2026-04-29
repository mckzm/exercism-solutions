create_inventory(items) = mergewith(+, [Dict(item => 1) for item in items]...)
list_inventory(inventory) = filter(entry -> entry.second > 0, inventory) |> collect |> sort!
remove_item(inventory, item) = delete!(copy(inventory), item)

function add_items(inventory, items)
    return mergewith(+, inventory, create_inventory(items))
end

function decrement_items(inventory, items)
    inventory = copy(inventory)

    for item in items
        if haskey(inventory, item) && inventory[item] > 0
            inventory[item] -= 1
        end
    end

    return inventory
end

