BEGIN {
    formatString = "One for %s, one for me.\n"
    name = "you"
}
NF { name = $0 }
END { printf(formatString, name) }

