# 'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot.
# 'M' means move forward one grid point, and maintain the same heading.

class Rover

  attr_accessor :x_coord, :y_coord, :direction

  def initialize(x_coord, y_coord, direction)
    @x_coord = x_coord
    @y_coord = y_coord
    @direction = direction
  end

  def read_instruction(instructions)
    ar_instructions = []
    ar_instruction = instructions.chars.to_a
    ar_instruction.each do |cmd|
      if cmd == "M"
        move
      elsif cmd == "R" || cmd == "L"
        turn(cmd)
      end
    end
  end

  def move
    case @direction
    when "N"
      @y_coord +=1
    when "S"
      @y_coord -=1
    when "E"
      @x_coord +=1
    when "W"
      @x_coord -=1
    end
  end

  def turn(cmd)
    if cmd == "L"
      case @direction
        when "N"
          @direction = "W"
        when "S"
          @direction = "E"
        when "E"
          @direction = "N"
        when "W"
          @direction = "S"
      end
    elsif cmd == "R"
        case @direction
        when "N"
          @direction = "E"
        when "S"
          @direction = "W"
        when "E"
          @direction = "S"
        when "W"
          @direction = "N"
        end
    end
  end

end

rover = Rover.new(1,1,"E")
puts "before new instructions"
puts rover.x_coord
puts rover.y_coord
puts rover.direction
rover.read_instruction("MLM")
puts "after new instructions"
puts rover.x_coord
puts rover.y_coord
puts rover.direction
