class AssemblyLine
  BASE_PRODUCTION_RATE = 221
  SUCCESS_RATE_FOR_SPEED = {
    0 => 0.0,
    1 => 1.0,
    2 => 1.0,
    3 => 1.0,
    4 => 1.0,
    5 => 0.9,
    6 => 0.9,
    7 => 0.9,
    8 => 0.9,
    9 => 0.8,
    10 => 0.77,
  }

  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    @speed * BASE_PRODUCTION_RATE * SUCCESS_RATE_FOR_SPEED[@speed]
  end

  def working_items_per_minute
    (production_rate_per_hour/60).floor
  end
end
