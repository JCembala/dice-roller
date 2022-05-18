# Before performing the roll specified in the point 2) generate a random number from within 1 - 30 range (i.e., roll a k30).
# If the result is contained within the 1-7 range (included), perform another k30 roll.
# Then if the result of additional roll is 1, write a logic which changes the behavior of throwing away the highest and the lowest numbers mentioned in the point 2) to: exclude two lowest numbers from the set.
class Dice

  def initialize(size = 20)
    @size = size
    @set = []
  end

  def roll
    roll_set_with_at_least_55_points
    roll_additional_dice
  end

  private

  def roll_dice(dice_size = @size)
    rand(1..dice_size)
  end

  def roll_set
    clear_set
    k30_set = []
    k30_set << roll_dice(30)
    k30_set << roll_dice(30) if k30_set.first.between?(1, 7)

    7.times { @set << roll_dice }

    if k30_set[1] == 1
      2.times { @set.delete_at(@set.index(@set.min)) }
    else
      @set.delete_at(@set.index(@set.max))
      @set.delete_at(@set.index(@set.min))
    end
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

  def clear_set
    @set = []
  end
end

dice = Dice.new
p dice.roll
