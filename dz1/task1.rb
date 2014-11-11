class Task1
  def initialize
    @avTempHash= Array.new(4){ Array.new(4) { Random.rand(-10..10) }}
    @negativeSum = 0;
    @avTempHash.each{ |m| m.each{ |x| self.m_print(x) }; puts }
  end

  def m_print(x)
    print ' ' if (x >= 0)
    print ' ' if (x.abs < 10)
    print ' ' + x.to_s
  end

  def test_negative(x)
    if(x < 0)
      @negativeSum += x
      print ' ' + x.to_s
    end
  end

  def get_negative_sum
    @avTempHash.each{ |m| m.each{ |x| self.test_negative(x) } }
    puts
    @negativeSum
  end
end

t = Task1.new
puts "Negative sum= #{t.get_negative_sum}";