check_drinks(drink_name, drink_ingredients) = drink_name * (isdisjoint(Set(drink_ingredients), ALCOHOLS) ? " Mocktail" : " Cocktail")
clean_ingredients(dish_name, dish_ingredients) = (dish_name, Set(dish_ingredients))
compile_ingredients(dishes) = union(dishes...)
separate_appetizers(dishes, appetizers) = setdiff(Set(dishes), Set(appetizers)) |> collect
tag_special_ingredients(dish) = (dish[1], Set(dish[2]) ∩ SPECIAL_INGREDIENTS)

function categorize_dish(dish_name, dish_ingredients)
    DISH_CATEGORIES = ("KETO" => KETO, "OMNIVORE" => OMNIVORE, "PALEO" => PALEO, "VEGAN" => VEGAN, "VEGETARIAN" => VEGETARIAN)

    for cat in DISH_CATEGORIES
        dish_ingredients ⊆ cat[2] && return "$(dish_name): $(cat[1])"
    end
end

singleton_ingredients(dishes, intersection) = setdiff(union(dishes...), intersection)
