BEGIN {
    FS = ","
}

{
    # generate and print the output for each record:
    # #<id>, <label> = <average>
    print "#" $1 FS, $2, "=", (($3$4) + ($5$6)) / 2
}
