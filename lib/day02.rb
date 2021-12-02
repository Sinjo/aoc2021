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

  def part_a_cursed(input)
    apply_part_a_extension
    eval input
    @horizontal_position * @depth
  end

  def part_b_cursed(input)
    apply_part_b_extension
    eval input
    @horizontal_position * @depth
  end

  private

  def apply_part_a_extension
    @horizontal_position = 0
    @depth = 0
    self.extend(PartAExtension)
  end

  def apply_part_b_extension
    @horizontal_position = 0
    @depth = 0
    @aim = 0
    self.extend(PartBExtension)
  end
end

module PartAExtension
  def forward(i)
    @horizontal_position += Integer(i)
  end

  def down(i)
    @depth += Integer(i)
  end

  def up(i)
    @depth -= Integer(i)
  end
end

module PartBExtension
  def forward(i)
    forward_units = Integer(i)
    @horizontal_position += forward_units
    @depth += @aim * forward_units
  end

  def down(i)
    @aim += Integer(i)
  end

  def up(i)
    @aim -= Integer(i)
  end
end
