class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class SequenceFinder
  def initialize(array_of_lines)
    @lines = array_of_lines
  end

  def find_sequence(line)
    sub_width = line[0].length
    while true
      sub_indices_to_try = line[0].length - sub_width
      (0..sub_indices_to_try).each do |index|
        current_sub = line[0][index..sub_width]
        return current_sub if line[1].include?(current_sub)
      end
      sub_width -= 1
    end
  end

  def find_for_all
    @lines.each {|line| p find_sequence(line.split(';'))}
  end
end

input_lines = FileReader.cleanfile(ARGV[0])
SequenceFinder.new(input_lines).find_for_all