class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class Stack
  def initialize(array_of_lines)
    @lines = array_of_lines
  end

  def alternate_stack(line)
    line.reverse.each_slice(2).map(&:first).join(' ')
  end

  def convert_all
    @lines.each {|line| puts alternate_stack(line.split)}
  end
end

input_lines = FileReader.cleanfile(ARGV[0])
Stack.new(input_lines).convert_all

