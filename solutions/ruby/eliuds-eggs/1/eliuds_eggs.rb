module EliudsEggs
  def self.egg_count(n)
    (n.size * 8).times.inject {|acc, i| acc + (n & (1 << (i - 1)) != 0 ? 1 : 0)}
  end
end
