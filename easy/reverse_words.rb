class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end


class WordReverser
  def initialize(array_of_lines)
    @array_of_lines = array_of_lines
  end

  def reverse_words
    @array_of_lines.map {|line| line.split.reverse.join(" ")}
  end

  def print
    reverse_words.each {|line| puts line}
  end
end

input = FileReader.cleanfile(ARGV[0])
WordReverser.new(input).print