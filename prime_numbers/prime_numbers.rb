require 'prime.rb'
class PrimeNumbers
  def initialize
    arr = Array(1..1000).select!{|n| Prime.prime?(n) && (n.to_s == n.to_s.reverse) }
    arr.count.times{ puts arr.to_s; arr << arr.shift}
  end

  def is_prime(n)
    return false if n <= 1
    2.upto(Math.sqrt(n).to_i) do |x|
      return false if n%x == 0
    end
    true
  end
end

PrimeNumbers.new
