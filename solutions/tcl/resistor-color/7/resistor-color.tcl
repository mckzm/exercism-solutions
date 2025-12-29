namespace eval resistorColor {
    proc colorCode {color} {
	    set index [lsearch -exact [colors] $color]
	    if {$index == -1} { error "Invalid color: $color" }
	    return $index
    }

    proc colors {} {
	    return {black brown red orange yellow green blue violet grey white}
    }
}
