BEGIN {
    FS = ","
    allergensList = "eggs,peanuts,shellfish,strawberries,tomatoes,chocolate,pollen,cats"
    currPowerOfTwo = 1
    for (i = 1; i <= split(allergensList, _allergens); i++) {
        allergens[_allergens[i]] = currPowerOfTwo
        allergens[currPowerOfTwo] = _allergens[i]
        currPowerOfTwo *= 2
    }
    delete _allergens
}

$2 == "allergic_to" { print and($1, allergens[$3]) ? "true" : "false"; next }
$2 == "list" { aggregate = $1; next }

END {
    if (aggregate) {
        for (i = 1; i <= 128; i *= 2) {
            allergies =  and(i, aggregate) ?
                (allergies (allergies ? "," : "") allergens[i]) :
                allergies
        }
        print allergies
    }
}
