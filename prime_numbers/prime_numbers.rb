class PrimeNumbers
  def initialize
    arr = Array(2..1000).select!{|n| (n.to_s == n.to_s.reverse) && Array(2..Math.sqrt(n).to_i).all? {|x| n%x != 0}}
    arr.count.times{ puts arr.to_s; arr << arr.shift}
  end
end
PrimeNumbers.new
