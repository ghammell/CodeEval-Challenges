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

  # DOESN'T WORK FOR CHALLENGE
  def find_sequence(line)
    return true if line[0] == line[1]

    num_to_delete = 1
    until num_to_delete == line[0].length
      (0...line[0].length).each do |index|
        remove_indices = (index...(index+num_to_delete)).to_a
        selection_to_check = line[0].each_with_index.select {|value, index| !remove_indices.include?(index)}.map(&:first)
        p selection_to_check
        p check_sequence(selection_to_check, line[1])
      end
      puts
      num_to_delete += 1
    end
  end

  # THIS IS COOL THOUGH
  def check_sequence(char_set1, char_set2)
    return true if char_set1 == []

    new_index = char_set2.index(char_set1[0])
    if new_index == nil
      return false
    else
      char_set1.delete_at(0)
      check_sequence(char_set1, char_set2[new_index+1..-1])
    end
  end

  def turn_line_to_array(line)
    line.split(';').map {|string| string.chars}
  end

  def find_for_all
    @lines.each {|line| p find_sequence(turn_line_to_array(line))}
  end
end

input_lines = FileReader.cleanfile(ARGV[0])
p SequenceFinder.new(input_lines).check_sequence(['M','J','A','U'], ['Z','B','M','Z','J','A','W','X','U'])

# DOESN'T WORK FOR CHALLENGE
# SequenceFinder.new(input_lines).find_for_all