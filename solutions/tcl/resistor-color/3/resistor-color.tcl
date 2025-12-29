namespace eval resistorColor {
    proc get-colors-to-codes {} {
	    return [dict create {*}{
		    black 0
		    brown 1
		    red 2
		    orange 3
		    yellow 4
		    green 5
		    blue 6
		    violet 7
		    grey 8
		    white 9
	    }]
    }

    proc colorCode {color} {
	    set myColorsToCodes [get-colors-to-codes]

	    if {[dict exists $myColorsToCodes $color]} {
		    return [dict get $myColorsToCodes $color]
	    } else {
		    error "Invalid color: $color"
	    }
    }

    proc colors {} {
	    return [dict keys [get-colors-to-codes]]
    }
}
