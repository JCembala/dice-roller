# In this iteration we would like to perform additional roll, which would be appended to the set as last.
# Again, this should not count for the at least 55 rule.
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

  def roll_set_with_at_least_55_points
    loop do
      roll_set
      break if @set.sum >= 55
    end

    @set
  end

  def roll_additional_dice
    @set << roll_dice
  end

  def final_roll
    roll_set_with_at_least_55_points
    roll_additional_dice
  end
end

dice = Dice.new
p dice.final_roll
