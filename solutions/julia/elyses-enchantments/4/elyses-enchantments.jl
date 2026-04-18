get_item(stack, position) = stack[position]

function set_item!(stack, position, replacement_card)
    stack[position] = replacement_card
    return stack
end

insert_item_at_top! = push!

remove_item! = deleteat!

function remove_item_from_top!(stack)
    pop!(stack)
    return stack
end

insert_item_at_bottom! = pushfirst!

function remove_item_at_bottom!(stack)
    popfirst!(stack)
    return stack
end

check_size_of_stack(stack, stack_size) = length(stack) == stack_size
