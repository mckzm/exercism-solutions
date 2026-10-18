module main
fn reverse_string(str string) string {
	mut rev := ''

	for r in str.runes() {
		rev = '${r}${rev}'
	}

	return rev
}
