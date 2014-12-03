class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class StringTrailer
  def initialize(array_of_lines)
    @lines = array_of_lines
  end

  def determine_if_trailing(line)
    sentence, word = line.split(',')
    sentence[-(word.length)..-1] == word ? 1 : 0
  end

  def convert_all
    @lines.each {|line| puts determine_if_trailing(line)}
  end
end

input_lines = FileReader.cleanfile(ARGV[0])
StringTrailer.new(input_lines).convert_all