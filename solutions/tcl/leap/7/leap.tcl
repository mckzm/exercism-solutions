#!/usr/bin/env tclsh

proc isLeapYear {year} {
	return [expr {($year & 3) == 0 && (($year % 25 != 0) || ($year & 15) == 0)}]
}
