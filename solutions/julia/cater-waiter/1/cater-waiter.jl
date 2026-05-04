function clean_ingredients(dish_name, dish_ingredients)
    return (dish_name, Set(dish_ingredients))
end

function check_drinks(drink_name, drink_ingredients)
    drink_type = isdisjoint(Set(drink_ingredients), ALCOHOLS) ? "Mocktail" : "Cocktail"
    return "$(drink_name) $(drink_type)"
end

function categorize_dish(dish_name, dish_ingredients)
    issubset(dish_ingredients, KETO) && return "$(dish_name): KETO"
    issubset(dish_ingredients, OMNIVORE) && return "$(dish_name): OMNIVORE"
    issubset(dish_ingredients, PALEO) && return "$(dish_name): PALEO"
    issubset(dish_ingredients, VEGAN) && return "$(dish_name): VEGAN"
    issubset(dish_ingredients, VEGETARIAN) && return "$(dish_name): VEGETARIAN"
end

function tag_special_ingredients(dish)
    special_ingredients = intersect(Set(dish[2]), SPECIAL_INGREDIENTS)
    return (dish[1], special_ingredients)
end

function compile_ingredients(dishes)
    ingredients = Set()

    for dish in dishes
        ingredients = ingredients ∪ dish
    end

    return ingredients
end

function separate_appetizers(dishes, appetizers)
    return collect(setdiff(Set(dishes), Set(appetizers)))
end

function singleton_ingredients(dishes, intersection)
    singletons = Set()

    for dish in dishes
        singletons = singletons ∪ setdiff(dish, intersection)
    end

    return singletons
end
