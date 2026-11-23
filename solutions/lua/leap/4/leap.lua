local is_divisible_by = function(number, divisor)
  return number % divisor == 0
end

local leap_year = function(year)
  return is_divisible_by(year, 4) and
    (not is_divisible_by(year, 100) or
      is_divisible_by(year, 400))
end

return leap_year
