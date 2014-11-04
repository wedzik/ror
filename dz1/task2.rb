class Task2
  def initialize
    @m= Array.new(4){ Array.new(4) { Random.rand(20)-10 } }
    @negativeSum = 0;
    @m.each{ |m| m.each{ |x| self.mPrint(x) }; puts }
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

  def run
    puts
    @m.each{ |m| m.each{ |x| self.testNegative(x) } }
    puts
    puts "Negative sum= #@negativeSum";
  end
end

t = Task2.new
t.run