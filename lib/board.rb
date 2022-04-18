# Board is responsible for knowing the state of the board, displaying itself, and utility functions
class Board
  attr_accessor :positions

  def initialize(testing = false)
    @positions = Array.new(8) { Array.new(8, nil) }
    place_pieces unless testing
  end

  def place_pieces
    place_pawns
  end

  def place_pawns
    place_white_pawns
    place_black_pawns
  end

  def place_white_pawns
    0.upto(7) do |x|
      @positions[7][x] = Pawn.new([7, x], true)
    end
  end

  def place_black_pawns
    0.upto(7) do |x|
      @positions[0][x] = Pawn.new([0, x], false)
    end
  end

  def display
    clear
    display_top_border
    display_rows
    display_bottom_border
    display_x_axis
  end

  def clear
    system 'clear'
    system 'cls'
  end

  def display_top_border
    puts '   ┌────┬────┬────┬────┬────┬────┬────┬────┐'
  end

  def display_rows
    (1..7).each do |row_number|
      display_row(row_number)
      display_separator
    end
    display_row(8)
  end

  def display_row(number)
    square = number.even? ? 0 : 1
    print "#{9 - number}  "
    @positions[number - 1].each do |position|
      if position.nil?
        print square.even? ? '│    ' : "│#{'    '.bg_black}"
      else
        print square.even? ? "│ #{position.icon}  " : "│#{" #{position.icon}  ".bg_black}"
      end
      square += 1
    end
    puts '│'
  end

  def display_separator
    puts '   ├────┼────┼────┼────┼────┼────┼────┼────┤'
  end

  def display_bottom_border
    puts '   └────┴────┴────┴────┴────┴────┴────┴────┘'
  end

  def display_x_axis
    puts "     a    b    c    d    e    f    g    h  \n\n"
  end

  def self.clone(positions)
    cache = Marshal.load(Marshal.dump(positions))
  end

  def self.includes?(x, y)
    within_seven?(x) && within_seven?(y)
  end

  def self.within_seven?(number)
    (0..7).cover?(number)
  end
end
