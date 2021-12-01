class Day01
  def part_a(input)
    depths = input.lines.map { |i|
      Integer(i)
    }.each_cons(2).filter { |a, b|
      b > a
    }.count
  end

  def part_b(input)
    depths = input.lines.map { |i|
      Integer(i)
    }.each_cons(3).each_cons(2).filter { |a, b|
      b.sum > a.sum
    }.count
  end
end
