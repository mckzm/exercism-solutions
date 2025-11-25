class Phrase
  attr_reader :text, :word_count

  def initialize(text)
    @text = text
    @word_count = build_word_count
  end

  private

  def build_word_count
    word_freq = {}
    text
      .downcase
      .split(/[^[:alnum:]']/)
      .map { |s| s.delete_prefix("'").delete_suffix("'") }
      .select { |s| !s.empty? }
      .map { |s| word_freq[s] ? word_freq[s] += 1 : word_freq[s] = 1 }
    word_freq
  end
end
