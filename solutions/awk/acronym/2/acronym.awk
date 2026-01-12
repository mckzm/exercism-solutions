BEGIN { FPAT = "[A-Za-z]['A-Za-z]*" }
{
    acronym = ""
    for (i = 1; i <= NF; i++) {
        acronym = acronym toupper(substr($i, 1, 1))
    }
    print acronym
}
