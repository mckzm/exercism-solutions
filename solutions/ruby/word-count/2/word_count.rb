class Phrase
  attr_reader :text, :word_count

  def initialize(text)
    @text = text
    @word_count = build_word_count
  end

  private

  def build_word_count
    text
      .downcase
      .scan(/\b[\w']+\b/)
      .each_with_object(Hash.new(0)) { |word, count_of| count_of[word] += 1 }
  end
end
