shift_back(value, amount) = Int32(value) >>> amount

set_bits(value, mask) = value | mask

flip_bits(value, mask) = xor(value, mask)

clear_bits(value, mask) = value & ~mask
