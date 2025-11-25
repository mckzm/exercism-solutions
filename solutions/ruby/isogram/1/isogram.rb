module Isogram
  def self.isogram?(s)
    letters = s.gsub(/[^[:alpha:]]/, '').downcase.chars
    letters == letters.uniq
  end
end
