class SumPrimes
  def self.sum_primes(limit)
    collect_primes(limit).inject(:+)
  end

  def self.collect_primes(limit)
    primes = []; i = 2
    until primes.length == limit
      if is_prime?(i) then primes << i end
      i += 1
    end
    primes
  end

  def self.is_prime?(num)
    (2..(num/2)).none? {|check_num| num % check_num == 0 }
  end
end

p SumPrimes.sum_primes(1000)