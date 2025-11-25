module Acronym
  def self.abbreviate(s)
    s.scan(/[[:alpha:]]+/).sum('') { |word| word[0].upcase }
  end
end
