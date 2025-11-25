module Hamming
  def self.compute(s1, s2)
    raise ArgumentError if s1.length != s2.length
    s1.split('').zip(s2.split('')).count {|pair| pair[0] != pair[1]}
  end
end
