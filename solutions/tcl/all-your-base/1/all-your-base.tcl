proc rebase {inputBase digits outputBase} {
	if {$inputBase < 2} { error "input base must be >= 2" }
	if {$outputBase < 2} { error "output base must be >= 2" }

	set digits [lreverse $digits]
	set n 0
	for {set idx 0} {$idx < [llength $digits]} {incr idx} {
		set digit [lindex $digits $idx]
		if {$digit < 0 || $digit >= $inputBase} { error "all digits must satisfy 0 <= d < input base" }
		incr n [expr $digit * [expr $inputBase ** $idx]]
	}

	set outputDigits {}
	if {$n == 0} {
		lappend outputDigits 0
	} else {
		while {$n > 0} {
			lappend outputDigits [expr $n % $outputBase]
			set n [expr $n / $outputBase]
		}
	}

	return [lreverse $outputDigits]
}
