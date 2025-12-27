#!/usr/bin/env tclsh

proc isLeapYear {year} {
	if {[isDivisibleBy $year 4]} {
		if {[isDivisibleBy $year 100]} { return [isDivisibleBy $year 400] }
		return 1
	}
	return 0
}

proc isDivisibleBy {n m} { return [expr {$n % $m == 0}] }
