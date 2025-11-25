module Reverser
  def self.reverse(s)
    s.length <= 1 ? s : reverse(s[1..]) + s[0]
  end
end
