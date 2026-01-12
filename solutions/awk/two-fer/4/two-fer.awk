BEGIN { formatString = "One for %s, one for me.\n" }
NF { name = $0 }
END { printf(formatString, typeof(name) == "untyped" || !name ? "you" : name) }

