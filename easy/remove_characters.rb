class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class Scrubber
  def initialize(array_of_lines)
    @lines = array_of_lines
  end

  def scrub_line(line)
    line[0].gsub!(/[#{line[1]}]/, '')
  end

  def scrub_all
    @lines.each {|line| puts scrub_line(line.split(', '))}
  end
end

input_lines = FileReader.cleanfile(ARGV[0])
Scrubber.new(input_lines).scrub_all