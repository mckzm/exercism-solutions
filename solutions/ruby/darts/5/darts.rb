class Darts
  attr_reader :throw, :target
  
  def initialize(x, y)
   @throw = Point.new(x, y)
   @target = Target.new([
     Circle.new(1.0, 10),
     Circle.new(5.0, 5),
     Circle.new(10.0, 1),
   ])
  end
  
  def score
    @target.score_throw(@throw)
  end
end

class Point
  attr_reader :x, :y
  
  def initialize(x, y)
    @x = x
    @y = y
  end

  def radius
    Math.hypot(@x, @y)
  end
end

class Circle
  attr_reader :radius, :score

  def initialize(radius, score)
    @radius = radius
    @score = score
  end
end

class Target
  attr_reader :circles

  def initialize(circles)
    @circles = circles
  end

  def score_throw(point)
    @circles.find {|circle| point.radius <= circle.radius}&.score || 0
  end
end
