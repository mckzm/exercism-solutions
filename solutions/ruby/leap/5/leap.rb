module Year
  def self.leap?(year)
    year.is_divisible_by(4) && (!year.is_divisible_by(100) || year.is_divisible_by(400))
  end

  Integer.class_eval do
    def is_divisible_by(divisor)
      self % divisor == 0
    end
  end
end
