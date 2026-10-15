module main

fn reverse_string(str string) string {
    mut rev := ''

    for c in str {
        rev = c.ascii_str() + rev
    }

    return rev
}
