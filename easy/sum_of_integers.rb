class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class IntegerSummer
  def initialize(array_of_lines)
    @lines = array_of_lines
  end

  def find_largest_sum(line)
    line = to_integers(line)
    largest_sum = line.max
    (0...line.length).each do |index|
      (index...line.length).each do |index2|
        current_sum = line[index..index2].inject(:+)
        largest_sum = current_sum if current_sum > largest_sum
      end
    end
    largest_sum
  end

  def to_integers(line)
    line.gsub(' ', '').split(',').map(&:to_i)
  end

  def output_each_line
    @lines.each {|line| puts find_largest_sum(line)}
  end
end

input_lines = FileReader.cleanfile(ARGV[0])
IntegerSummer.new(input_lines).output_each_line