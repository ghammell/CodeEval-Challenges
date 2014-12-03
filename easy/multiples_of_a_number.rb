class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class MultipleGenerater
  def initialize(input_lines)
    @input_lines = input_lines
  end

  def find_smallest_greater(line)
    inputs = line.split(',').map(&:to_i)
    increment = inputs[1]
    until inputs[1] >= inputs[0]
      inputs[1] += increment
    end
    inputs[1]
  end

  def print_results
    @input_lines.each {|line| puts find_smallest_greater(line)}
  end
end

input_lines = FileReader.cleanfile(ARGV[0])
MultipleGenerater.new(input_lines).print_results