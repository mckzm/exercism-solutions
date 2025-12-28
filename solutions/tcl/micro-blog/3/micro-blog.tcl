package require Tcl 9.0

proc truncate {input {maxSize 5}} {
	return [string range $input 0 $maxSize-1]
}
