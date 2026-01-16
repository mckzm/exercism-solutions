BEGIN {
    FS = ","
    valuesToAllergens[1]   = "eggs"
    valuesToAllergens[2]   = "peanuts"
    valuesToAllergens[4]   = "shellfish"
    valuesToAllergens[8]   = "strawberries"
    valuesToAllergens[16]  = "tomatoes"
    valuesToAllergens[32]  = "chocolate"
    valuesToAllergens[64]  = "pollen"
    valuesToAllergens[128] = "cats"

    for (i = 1; i <= 128; i *= 2) {
        allergen = valuesToAllergens[i]
        allergensToValues[allergen] = i
    }
}

$2 == "allergic_to" {
    print and($1, allergensToValues[$3]) ? "true" : "false";
    next
}

$2 == "list" { aggregate = $1; next }

END {
    if (aggregate) {
        for (i = 1; i <= 128; i *= 2) {
            allergies =  and(i, aggregate) ?
                (allergies (allergies ? "," : "") valuesToAllergens[i]) :
                allergies
        }
        print allergies
    }
}
