class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class FizzBuzzTranslater
  def initialize(count_start)
    @count_start = count_start
  end

  def translate_all(array_of_lines)
    array_of_lines.map do |line|
      split_line = split_line(line)
      translate_line(split_line[0], split_line[1], split_line[2])
    end
  end

  def split_line(line)
    line.split.map {|num| num.to_i}
  end

  def translate_line(divider1, divider2, count_end)
    result = (@count_start..count_end).map do |num|
      if num % divider1 == 0 and num % divider2 == 0 then 'FB'
      elsif num % divider1 == 0 then 'F'
      elsif num % divider2 == 0 then'B'
      else num
      end
    end
  end

  def print_results(array_of_lines)
    translate_all(array_of_lines).each {|line| puts line.join(" ")}
  end
end

input_lines = FileReader.cleanfile(ARGV[0])
translater = FizzBuzzTranslater.new(1)
translater.print_results(input_lines)

