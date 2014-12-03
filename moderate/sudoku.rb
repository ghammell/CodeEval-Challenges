class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class SudokuVerifier
  def initialize(array_of_lines)
    @lines = array_of_lines
  end

  def verify_each
    @lines.each {|line| p verify_line(line)}
  end

  def verify_line(line)
    board = create_board(line)
    board.each {|row| return false if !verify_group(row)}
    return false if verify_columns(board) == false
    return false if verify_squares(board) == false
    return true
  end

  def verify_squares(board)
    size = board.length
    board.transpose.each do |row|
      row.flatten.each_slice(size) {|square| return false if !verify_group(square.flatten)}
    end
  end

  def verify_columns(board)
    (0...board.length).each do |column_index|
      column = (0...board.length).inject([]) {|column, row_index| column << board[row_index].flatten[column_index]}
      return false if !verify_group(column)
    end
  end

  def verify_group(row)
    row.flatten.map(&:to_i).sort == (1..row.flatten.length).to_a
  end

  def create_board(line)
    size = line.split(';')[0].to_i
    solution = line.split(';')[1]
    solution.split(',').each_slice(size).map {|slice| slice.each_slice(Math.sqrt(size)).to_a}
  end
end

input_lines = FileReader.cleanfile(ARGV[0])
SudokuVerifier.new(input_lines).verify_each