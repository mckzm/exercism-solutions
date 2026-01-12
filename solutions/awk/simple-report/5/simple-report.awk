BEGIN { FS = "," }

{
    # #<id>, <label> = <average>
    printf("#%d, %s = %d\n", $1, $2, (($3$4) + ($5$6)) / 2)
}
