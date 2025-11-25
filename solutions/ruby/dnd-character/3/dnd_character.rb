class DndCharacter
  @@attributes = %w(strength dexterity constitution intelligence wisdom charisma)
  attr_reader *@@attributes

  def initialize
    @@attributes.each {|a| instance_variable_set("@#{a}", roll_dice)}
  end

  def roll_dice
    4.times.map {rand(1..6)}.sort[1..].sum
  end

  def self.modifier(constitution)
    (constitution - 10) / 2
  end

  def hitpoints
    self.class.modifier(constitution) + 10
  end
end
