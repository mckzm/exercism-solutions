module main

fn two_fer(name string) string {
    return "One for ${if name == '' {'you'} else {name}}, one for me."
}
