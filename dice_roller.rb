# In this iteration, running the dice_roller.rb script should display the following:
# "Your randomly generated set: #{results}. Are you happy?" and the input prompt.
# Entering anything other than "YES!" restarts the script.
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

  def clear_set
    @set = []
    @additional_set = []
  end
end

dice = Dice.new

loop do
  current_set = dice.roll

  puts "Your randomly generated set: #{current_set}. Are you happy?"

  break if gets.chomp == 'YES!'
end
