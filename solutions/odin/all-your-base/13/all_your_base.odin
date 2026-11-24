package all_your_base

import "core:slice"

Error :: enum {
	None,
	Invalid_Input_Digit,
	Input_Base_Too_Small,
	Output_Base_Too_Small,
}

rebase :: proc(input_base: int, digits: []int, output_base: int) -> (out_digits: []int, err: Error) {
	if input_base < 2 {
		return nil, .Input_Base_Too_Small
	}
	if output_base < 2 {
		return nil, .Output_Base_Too_Small
	}

	value := digits_to_value(digits, input_base) or_return
	out_digits = value_to_digits(value, output_base) or_return

    return
}

digits_to_value :: proc(digits: []int, base: int) -> (value: int, err: Error) {
	for digit in digits {
		if digit < 0 || digit >= base {
			return 0, .Invalid_Input_Digit
		}
		value = value * base + digit
	}
	
	return
}

value_to_digits :: proc(value: int, base: int) -> ([]int, Error) {
	digits: [dynamic]int
	
	if value == 0 {
		append(&digits, 0)
	} else {
		v := value
		for v > 0 {
			append(&digits, v % base)
			v /= base
		}
	}

	slice.reverse(digits[:])
	return digits[:], .None
}
