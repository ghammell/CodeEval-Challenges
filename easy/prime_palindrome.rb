require 'prime'

class PrimePalindrome
  def self.highest(limit)
    (1..1000).reverse_each.find {|num| num.prime? && num.to_s == num.to_s.reverse }
  end
end

p PrimePalindrome.highest(1000)