class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class ElementReturner
  def initialize(array_of_lines)
    @lines = array_of_lines
  end

  def return_element(line)
    index = line.pop.to_i
    index > line.length ? nil : line.reverse[index - 1]
  end

  def convert_all
    @lines.each {|line| puts return_element(line.split)}
  end
end

input_lines = FileReader.cleanfile(ARGV[0])
ElementReturner.new(input_lines).convert_all