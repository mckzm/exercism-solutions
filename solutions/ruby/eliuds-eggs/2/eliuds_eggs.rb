module EliudsEggs
  def self.popcount(n)
    n.digits(2).sum()
  end
  singleton_class.send(:alias_method, :egg_count, :popcount)
end
