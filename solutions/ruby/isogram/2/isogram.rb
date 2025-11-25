module Isogram
  def self.isogram?(s)
    letters = s.downcase.scan(/[[:alpha:]]/)
    letters == letters.uniq
  end
end
