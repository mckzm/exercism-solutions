module main

fn response(hey_bob string) string {
    trimmed := hey_bob.trim_space()
    
    is_silence := trimmed == ''
    is_all_caps := trimmed.is_upper()
    is_question := trimmed.ends_with("?")

    response := if is_all_caps {
        if is_question {
            "Calm down, I know what I'm doing!"
            } else {
                "Whoa, chill out!"
            }
    } else if is_question {
        "Sure."
    } else if is_silence {
        "Fine. Be that way!"
    } else {
        "Whatever."
    }

    return response
}
