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

    length := len(digits)
    result : [dynamic]int
    sum: int

	for digit, index in digits {
        if digit < 0 || digit >= input_base {
            return nil, .Invalid_Input_Digit
        }

        sum += digit * power_of(input_base, (length - index - 1))
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

power_of :: proc(base: int, exponent: int) -> int {
    result := 1
    for i in 1..=exponent {
        result *= base
    }

    return result
}
