class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class CycleDetecter
  def initialize(array_of_lines)
    @lines = array_of_lines
  end

  def detect_cycle(line)
    size = 1
    while true
      (0..line.length).each do |index|
        second_index = index + size
        first = line[index...(index+size)]
        second = line[second_index...(second_index+size)]
        if first == second then return first.join(" ") end
      end
      size += 1
    end
  end

  def convert_all
    @lines.each {|line| puts detect_cycle(line.split)}
  end
end

input_lines = FileReader.cleanfile(ARGV[0])
CycleDetecter.new(input_lines).convert_all
