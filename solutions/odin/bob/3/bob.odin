package bob

import "core:strings"
import "core:unicode"

response :: proc(input: string) -> string {
    input := strings.trim_space(input)
    is_question := strings.ends_with(input, "?")
    is_yelling := check_for_yelling(input)
    is_silence := len(input) == 0

    switch {
        case is_question && is_yelling:
            return "Calm down, I know what I'm doing!"
        case is_question:
            return "Sure."
        case is_yelling:
            return "Whoa, chill out!"
        case is_silence:
            return "Fine. Be that way!"
        case:
            return "Whatever."
    }
}

check_for_yelling :: proc(input: string) -> bool {
    has_lowercase, has_uppercase: bool

    for r in input {
        if unicode.is_lower(r) {
            has_lowercase = true
            break
        } else if unicode.is_upper(r) {
            has_uppercase = true
        }
    }

    return has_uppercase && !has_lowercase
}
