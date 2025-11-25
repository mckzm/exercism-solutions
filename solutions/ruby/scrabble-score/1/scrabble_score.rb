class Scrabble
  SCORES_OF = [ 
    [%w(A E I O U L N R S T), 1],
    [%w(D G), 2],
    [%w(B C M P), 3],
    [%w(F H V W Y), 4],
    [%w(K), 5],
    [%w(J X), 8],
    [%w(Q Z), 10],
  ].inject(Hash.new) {|h, arr| arr[0].each {|e| h[e] = arr[1]}; h} 

  attr_reader :str

  def initialize(s)
    @str = s.upcase
  end

  def score
    str.chars.reduce(0) {|acc, c| acc + SCORES_OF[c]}
  end
end
