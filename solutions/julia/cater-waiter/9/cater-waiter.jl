check_drinks(drink_name, drink_ingredients) = drink_name * (isdisjoint(Set(drink_ingredients), ALCOHOLS) ? " Mocktail" : " Cocktail")
clean_ingredients(dish_name, dish_ingredients) = (dish_name, Set(dish_ingredients))
tag_special_ingredients(dish) = (dish[1], Set(dish[2]) ∩ SPECIAL_INGREDIENTS)

function categorize_dish(dish_name, dish_ingredients)
    DISH_CATEGORIES = ("KETO" => KETO, "OMNIVORE" => OMNIVORE, "PALEO" => PALEO, "VEGAN" => VEGAN, "VEGETARIAN" => VEGETARIAN)

    for cat in DISH_CATEGORIES
        dish_ingredients ⊆ cat[2] && return "$(dish_name): $(cat[1])"
    end
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
