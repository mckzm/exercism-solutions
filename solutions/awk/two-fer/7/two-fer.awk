function twoFer(name) {
    return "One for " (name ? name : "you") ", one for me."
}
END { print twoFer($0) }

