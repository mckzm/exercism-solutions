fun reverse(input: String): String {
    return input.fold("") { acc, c -> c + acc}
}
