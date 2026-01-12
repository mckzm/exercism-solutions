BEGIN { FS = " |-" }
{
    acronym = ""
    for (i = 1; i <= NF; i++) {
        gsub(/[^[:alnum:]]/, "", $i)
        acronym = acronym toupper(substr($i, 1, 1))
    }
    print acronym
}
