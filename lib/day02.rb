class Day02
  def part_a(input)
    horizontal_position = 0
    depth = 0

    input.lines.each do |line|
      case line
      when /forward (\d+)/
        horizontal_position += Integer($1)
      when /down (\d+)/
        depth += Integer($1)
      when /up (\d+)/
        depth -= Integer($1)
      else
        puts "Failed to process line: #{line}"
      end
    end

    horizontal_position * depth
  end

  def part_b(input)
    horizontal_position = 0
    depth = 0
    aim = 0

    input.lines.each do |line|
      case line
      when /forward (\d+)/
        forward_units = Integer($1)
        horizontal_position += forward_units
        depth += aim * forward_units
      when /down (\d+)/
        aim += Integer($1)
      when /up (\d+)/
        aim -= Integer($1)
      else
        puts "Failed to process line: #{line}"
      end
    end

    horizontal_position * depth
  end
end
