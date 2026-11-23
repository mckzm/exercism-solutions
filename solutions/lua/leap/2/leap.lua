local leap_year = function(year)
  return year % 4 == 0 and (year % 100 ~= 0 or year % 400 == 0)
end

return leap_year
