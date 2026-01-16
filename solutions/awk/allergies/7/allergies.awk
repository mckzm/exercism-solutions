BEGIN {
    FS = ","
    allergensList = \
        "eggs,peanuts,shellfish,strawberries,tomatoes,chocolate,pollen,cats"
    split(allergensList, allergens)
    for (idx in allergens) {
        values[allergens[idx]] = lshift(1, idx - 1)
    }
}

$2 == "allergic_to" { print and($1, values[$3]) ? "true" : "false"; next }

$2 == "list" {
    for (idx in allergens) {
        allergies =  and($1, (2 ** (idx - 1))) ?
            (allergies (allergies ? "," : "") allergens[idx]) :
            allergies
    }
    print allergies
}
