get_item(stack, position) = stack[position]

function set_item!(stack, position, replacement_card)
    stack[position] = replacement_card
    return stack
end

function insert_item_at_top!(stack, new_card)
    return push!(stack, new_card)
end

remove_item!(stack, position) = deleteat!(stack, position)

function remove_item_from_top!(stack)
    pop!(stack)
    return stack
end

insert_item_at_bottom!(stack, new_card) = pushfirst!(stack, new_card)

function remove_item_at_bottom!(stack)
    popfirst!(stack)
    return stack
end

check_size_of_stack(stack, stack_size) = length(stack) == stack_size
