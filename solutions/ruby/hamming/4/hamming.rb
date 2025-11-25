module Hamming
  def self.compute(s1, s2)
    raise ArgumentError if s1.length != s2.length
    (0..s1.length).count {|i| s1[i] != s2[i]}
  end
end
