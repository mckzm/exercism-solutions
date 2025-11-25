module Reverser
  def self.reverse(s)
    s.split("").reduce(String.new) {|rev, c| rev.insert(0, c)}
  end
end
