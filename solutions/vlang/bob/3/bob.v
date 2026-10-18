module main

fn response(hey_bob string) string {
	trimmed := hey_bob.trim_space()

	is_silence := trimmed == ''
	is_all_caps := trimmed.is_upper()
	is_question := trimmed.ends_with('?')

	return match true {
		is_all_caps && is_question { "Calm down, I know what I'm doing!" }
		is_all_caps { 'Whoa, chill out!' }
		is_question { 'Sure.' }
		is_silence { 'Fine. Be that way!' }
		else { 'Whatever.' }
	}
}
