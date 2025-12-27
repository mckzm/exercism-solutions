#!/usr/bin/env tclsh

proc isLeapYear {year} {
	return [expr {$year % 4 == 0 && $year % 25 != 0 || $year % 16 == 0}]
}
