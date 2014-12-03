class FileReader
  def self.open(file)
    File.open(file)
  end

  def self.cleanfile(file)
    open(file).readlines.map {|line| line.chomp}
  end
end

class PrimeGetter
  def initialize(array_of_lines)
    @lines = array_of_lines
  end

  def get_primes(num)
    odds = (2..num.to_i).select {|num| num.odd?}
    primes = odds.select {|num| is_prime?(num)}
    if num.to_i >= 2 then primes.unshift(2).join(',') end
  end

  def is_prime?(num)
    (2..num/2).none? {|test_num| num % test_num == 0}
  end

  def get_primes_for_all
    @lines.each {|limit_number| puts get_primes(limit_number)}
  end
end

input_lines = FileReader.cleanfile(ARGV[0])
PrimeGetter.new(input_lines).get_primes_for_all