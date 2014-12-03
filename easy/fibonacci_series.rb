class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class FibonacciSeries
  def self.find(num)
    if num == 0 || num == 1
      series = [num]
    else
      series = [1,1]
      until series.length == num
        next_index = series.length
        series[next_index] = series[next_index - 1] + series[next_index - 2]
      end
    end
    series.last
  end

  def self.print_results_for_set(input_lines)
    input_lines.each {|line| puts find(line.to_i)}
  end
end

input_lines = FileReader.cleanfile(ARGV[0])
FibonacciSeries.print_results_for_set(input_lines)

