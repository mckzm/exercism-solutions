module Reverser
  def self.reverse(s)
    s.split('').reduce(String.new) {|rev, c| rev.prepend(c)}
  end
end
