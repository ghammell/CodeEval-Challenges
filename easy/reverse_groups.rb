class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class GroupReverser
  def initialize(array_of_lines)
    @lines = array_of_lines
  end

  def reverese_all
    @lines.each {|line| puts reverse_line(line)}
  end

  def reverse_line(line)
    split_num = line.split(';')[1].to_i
    nums = line.split(';')[0].split(',').map(&:to_i)
    reversed_nums = nums.each_slice(split_num).map {|slice| slice.length == split_num ? slice.reverse : slice}
    reversed_nums.flatten.join(',')
  end
end

input_lines = FileReader.cleanfile(ARGV[0])
GroupReverser.new(input_lines).reverese_all