# In this iteration, running the dice_roller.rb should return 5 randomly generated numbers (five dice rolls).
# However, the script should obtain the set by initially generating 7 dice rolls and excluding the highest and the lowest ones!
# It is extremely important not to change the order of the numbers.

class Dice

  def initialize(size = 20)
    @size = size
    @set = []
  end

  def roll_dice(dice_size = @size)
    rand(1..dice_size)
  end

  def roll_set
    clear_set
    7.times { @set << roll_dice }
    @set.delete_at(@set.index(@set.max))
    @set.delete_at(@set.index(@set.min))

    @set
  end

  def clear_set
    @set = []
  end
end

dice = Dice.new
rolls = dice.roll_set

p rolls
