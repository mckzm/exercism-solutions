class Darts
  attr_reader :x, :y
  
  def initialize(x, y)
    @x = x
    @y = y
  end
  
  def score
    radius = Math.hypot(@x, @y)

    case radius
      when 0..1.0 then 10
      when 1.0..5.0 then 5
      when 5.0..10.0 then 1
      else 0
    end
  end
end
