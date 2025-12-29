proc rebase {inputBase digits outputBase} {
	if {$inputBase < 2} { error "input base must be >= 2" }
	if {$outputBase < 2} { error "output base must be >= 2" }

	return [to-digits [from-digits $digits $inputBase] $outputBase]
}

proc to-digits {n base} {
	if {$n == 0} { return {0} }

	while {$n > 0} {
		lappend digits [expr $n % $base]
		set n [expr $n / $base]
	}

	return [lreverse $digits]
}

proc from-digits {digits base} {
	set n 0

	foreach digit $digits {
		if {$digit < 0 || $digit >= $base} {
			error "all digits must satisfy 0 <= d < input base"
		}
		set n [expr $n * $base + $digit]
	}

	return $n
}
