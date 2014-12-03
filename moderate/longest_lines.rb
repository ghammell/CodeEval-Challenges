class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class LineCounter
  def initialize(array_of_lines)
    @count = array_of_lines[0].to_i
    @lines = array_of_lines[1..-1]
  end

  def sort
    @lines.sort_by {|line| line.length}.reverse
  end

  def print_results
    (0...@count).each {|index| puts sort[index]}
  end
end

input_lines = FileReader.cleanfile(ARGV[0])
LineCounter.new(input_lines).print_results