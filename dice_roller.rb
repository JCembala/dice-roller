# Please write a script called dice_roller.rb. 
# When launched using shell (ruby dice_roller.rb) it should display a randomly generated number from 1-20 range.
# Imagine this as rolling a twenty sided dice (k20).

class Dice

  def initialize(size = 20)
    @size = size
  end

  def roll
    rand(1..@size)
  end
end

dice = Dice.new
p dice.roll
