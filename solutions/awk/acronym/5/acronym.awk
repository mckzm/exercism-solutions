BEGIN { FPAT = "[[:alpha:]]['[:alpha:]]*" }
{
    acronym = ""
    for (i = 1; i <= NF; i++) acronym = acronym toupper(substr($i, 1, 1))
    print acronym
}
