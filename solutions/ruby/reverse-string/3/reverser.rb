module Reverser
  def self.reverse(s)
    return s if s.length == 1 || s.empty?
    reverse(s[1..]) + s[0]
  end
end
