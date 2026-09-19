fun reverse(input: String, acc: String = ""): String {
    return if (input.isEmpty()) acc
    else reverse(input.substring(1), input[0] + acc)
}
