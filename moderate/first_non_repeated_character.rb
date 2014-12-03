class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class CharacterFinder
  def initialize(array_of_lines)
    @lines = array_of_lines
  end

  def find_non_repeats(line)
    line.split('').select {|char| line.count(char) == 1}
  end

  def convert_all
    @lines.map {|line| puts find_non_repeats(line).first}
  end
end

input_lines = FileReader.cleanfile(ARGV[0])
CharacterFinder.new(input_lines).convert_all