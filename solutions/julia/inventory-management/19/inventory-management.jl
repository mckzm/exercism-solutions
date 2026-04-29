add_items(inventory, items) = mergewith(+, inventory, create_inventory(items))
create_inventory(items) = mergewith(+, [Dict(item => 1) for item in items]...)
list_inventory(inventory) = filter(entry -> entry.second > 0, inventory) |> collect |> sort!
remove_item(inventory, item) = delete!(copy(inventory), item)

function decrement_items(inventory, items)
    return reduce(items, init=copy(inventory)) do inventory, item
        if haskey(inventory, item)
            inventory[item] = max(0, inventory[item] - 1)
        end
        inventory
    end
end

