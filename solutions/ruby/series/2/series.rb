class Series
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def slices(length)
    raise ArgumentError if str.empty?
    raise ArgumentError if (length <= 0) || (length > str.size)
    str
       .each_char
       .map
       .with_index { |c, i| str[i, length] }
       .select { |e| e.size == length }
  end
end
