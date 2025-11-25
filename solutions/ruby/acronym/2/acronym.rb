module Acronym
  def self.abbreviate(s)
    s.upcase.split(/[^[:alpha:]]/).sum('') { |word| word[0] || '' }
  end
end
