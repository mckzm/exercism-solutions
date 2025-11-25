module Raindrops
  def self.convert(i)
    ret = String.new
    ret += "Pling" if is_divisible?(i, 3)
    ret += "Plang" if is_divisible?(i, 5)
    ret += "Plong" if is_divisible?(i, 7)
    ret.empty? ? i.to_s : ret
  end

  def self.is_divisible?(n1, n2)
    n1 % n2 == 0
  end
end
