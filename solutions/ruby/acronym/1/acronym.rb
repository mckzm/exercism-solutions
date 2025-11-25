module Acronym
  def self.abbreviate(s)
    strip_punctuation(s).split.map { |word| word[0].upcase }.join
  end

  def self.strip_punctuation(s)
    s.gsub(/[^[:alpha:][:space:]-]/, '').gsub('-', ' ')
  end

end
