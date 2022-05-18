# Use the results of k30 dice rolls, specified in the point 5) to do the following: 
# if the first roll is within the 1-7 range (included), and the second roll is within 24-30 (included), 
# then the additional roll specified in the point 4) (aka "the sixth one") should always equal to 25.
class Dice

  def initialize(size = 20)
    @size = size
    @set = []
    @additional_set = []
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
    @additional_set << roll_dice(30)
    @additional_set << roll_dice(30) if @additional_set.first.between?(1, 7)

    7.times { @set << roll_dice }

    if @additional_set[1] == 1
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
    return @set << 25 if !@additional_set[1].nil? && @additional_set[1].between?(24, 30)

    @set << roll_dice
  end

  def final_roll
    roll_set_with_at_least_55_points
    roll_additional_dice
  end

  def clear_set
    @set = []
    @additional_set = []
  end
end

dice = Dice.new
p dice.roll
