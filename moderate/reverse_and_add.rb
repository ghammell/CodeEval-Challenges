class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class ReverseAdder
  def initialize(array_of_lines)
    @lines = array_of_lines
  end

  def reverse_and_add(num)
    iteration_count = 0
    until check_palindrome(num)
      num += num.to_s.reverse.to_i
      iteration_count += 1
    end
    "#{iteration_count} #{num}"
  end

  def check_palindrome(num)
    num.to_s == num.to_s.reverse
  end

  def convert_all
    @lines.each {|input_number| puts reverse_and_add(input_number.to_i)}
  end
end


input_lines = FileReader.cleanfile(ARGV[0])
ReverseAdder.new(input_lines).convert_all