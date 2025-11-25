class Series
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def slices(length)
    raise ArgumentError if length > str.size
    str
       .each_char
       .each_cons(length)
       .map(&:join)
  end
end
