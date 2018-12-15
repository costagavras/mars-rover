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
    ar_instruction = instructions.char.to_a
    ar_instruction.each do |cmd|
      if cmd = "M"
        move
      elsif cmd = "R" || cmd = "L"
        turn(cmd)
      end
    end
    print rover
  end

  def move
    case rover.direction
    when "N"
      rover.y_coord +=1
    when "S"
      rover.y_coord -=1
    when "E"
      rover.x_coord +=1
    when "W"
      rover.x_coord -=1
    end
  end

  def turn(cmd)
    if cmd = "L"
      case rover.direction
        when "N"
          rover.direction = "W"
        when "S"
          rover.direction = "E"
        when "E"
          rover.direction = "N"
        when "W"
          rover.direction = "S"
      end
    elsif cmd = "R"
        case rover.direction
        when "N"
          rover.direction = "E"
        when "S"
          rover.direction = "W"
        when "E"
          rover.direction = "S"
        when "W"
          rover.direction = "N"
        end
    end
  end

end

rover = Rover.new(1,1,"E")
puts rover.x_coord
puts rover.y_coord
puts rover.direction
