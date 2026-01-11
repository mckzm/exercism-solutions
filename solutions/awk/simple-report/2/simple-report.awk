BEGIN {
    FS = ","
}

{
    # generate and print the output for each record:
    # #<id>, <label> = <average>
    print "#" $1 FS, $2, "=", (($3 + $5) * 10 + ($4 + $6)) / 2
}
