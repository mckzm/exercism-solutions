function twoFer() { printf("One for %s, one for me.\n", $0 ? $0 : "you") }
{ twoFer() }
END { if (NR == 0) { twoFer() } }

