function twoFer() {
    name = $0 ? $0 : "you"
        printf("One for %s, one for me.\n", name)
}
{ twoFer() }
END { if (NR == 0) { twoFer() } }

