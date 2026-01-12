NF { name = $0 }
END { printf("One for %s, one for me.\n", (typeof(name) == "untyped" || !name) ? "you" : name) }

