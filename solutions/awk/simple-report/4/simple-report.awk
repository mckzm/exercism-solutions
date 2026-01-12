BEGIN {
    FS = ","
}

{
    # generate and print the output for each record:
    # #<id>, <label> = <average>
    printf("#%d, %s = %d\n", $1, $2, (($3$4) + ($5$6)) / 2)
}
