# The script should generate the sets until it meets the following criteria:
# the sum of the 5 randomly generated numbers is higher or equal to 55.
# Returning a set which doesn't sum up to at least 55, is not valid.
# However, the rolls dropped by satisfying specification in the point 2) should not count to the at least 55 rule!

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
end

dice = Dice.new
p dice.roll_set_with_at_least_55_points
