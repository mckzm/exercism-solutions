tailrec fun reverse(input: String, acc: StringBuilder = StringBuilder(input.length)): String {
    return if (input.isEmpty()) acc.toString()
    else reverse(input.substring(1), acc.insert(0, input[0]))
}
