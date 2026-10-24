module main

fn raindrops(number int) string {
	mut sounds := ''
	if number % 3 == 0 { sounds += 'Pling' }
	if number % 5 == 0 { sounds += 'Plang' }
	if number % 7 == 0 { sounds += 'Plong' }

	return if sounds.len == 0 { number.str() } else { sounds }
}

