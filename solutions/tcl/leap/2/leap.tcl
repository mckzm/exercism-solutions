#!/usr/bin/env tclsh

proc isLeapYear {year} {
	if {$year % 4 == 0} {
		if {$year % 100 == 0} { return [expr $year % 400 == 0] }
		return 1
	}
	return 0
}
