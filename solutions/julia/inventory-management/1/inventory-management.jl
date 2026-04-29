function create_inventory(items)
    inventory = Dict();

    for item in items
        haskey(inventory, item) ? inventory[item] += 1 : inventory[item] = 1
    end

    return inventory
end

function add_items(inventory, items)
    inventory = copy(inventory)

    for item in items
        haskey(inventory, item) ? inventory[item] += 1 : inventory[item] = 1
    end

    return inventory
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

function remove_item(inventory, item)
    inventory = copy(inventory)

    if haskey(inventory, item)
        delete!(inventory, item)
    end

    return inventory
end

function list_inventory(inventory)
    inventory = copy(inventory)

    for item in keys(inventory)
        if inventory[item] == 0
            delete!(inventory, item)
        end
    end

    return sort(collect(inventory))
end
