class Task1
  def initialize
    @avTempHash= Array.new(4){ Array.new(4) { Random.rand(-10..10) } }
    @negativeSum = 0;
    @avTempHash.each{ |m| m.each{ |x| self.mPrint(x) }; puts }
  end

  def mPrint(x)
    print ' ' if(x >= 0)
    print ' ' if(x.abs < 10)
    print ' '+x.to_s
  end

  def testNegative(x)
    if(x < 0)
      @negativeSum += x
      print ' '+x.to_s
    end
  end

  def getNegativeSum
    @avTempHash.each{ |m| m.each{ |x| self.testNegative(x) } }
    puts
    @negativeSum
  end
end

t = Task1.new
puts "Negative sum= #{t.getNegativeSum}";