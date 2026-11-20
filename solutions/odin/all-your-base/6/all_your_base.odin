package all_your_base

import "core:slice"

Error :: enum {
	None,
	Invalid_Input_Digit,
	Input_Base_Too_Small,
	Output_Base_Too_Small,
}

rebase :: proc(input_base: int, digits: []int, output_base: int) -> ([]int, Error) {
	if input_base < 2 {
		return nil, .Input_Base_Too_Small
	}
	if output_base < 2 {
		return nil, .Output_Base_Too_Small
	}

	result: [dynamic]int
	sum: int

	for digit in digits {
		if digit < 0 || digit >= input_base {
			return nil, .Invalid_Input_Digit
		}
		sum = sum * input_base + digit
	}

	if sum == 0 {
		append(&result, 0)
	} else {
		for sum > 0 {
			append(&result, sum % output_base)
			sum /= output_base
		}
	}

	slice.reverse(result[:])
	return result[:], .None
}
