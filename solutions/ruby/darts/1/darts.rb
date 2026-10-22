include Math

class Darts
  attr_accessor :x, :y
  
  def initialize(x, y)
    self.x = x
    self.y = y
  end
  
  def score
    radius = Math.hypot(self.x, self.y)
    
    return 10 if radius <= 1.0
    return 5 if radius <= 5.0
    return 1 if radius <= 10.0

    0  
  end
end
