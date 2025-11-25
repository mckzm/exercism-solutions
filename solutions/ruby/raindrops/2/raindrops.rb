module Raindrops
  SOUNDS_OF = {3 => "Pling", 5 => "Plang", 7 => "Plong"}

  def self.convert(i)
    melody = SOUNDS_OF.select {|k, _| is_divisible?(i, k)}.values.join
    melody.empty? ? i.to_s : melody
  end

  def self.is_divisible?(n1, n2)
    n1 % n2 == 0
  end
end
