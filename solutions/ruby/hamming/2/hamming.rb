module Hamming
  def self.compute(s1, s2)
    raise ArgumentError if s1.length != s2.length
    s1.split('').zip(s2.split('')).count {|c1, c2| c1 != c2}
  end
end
