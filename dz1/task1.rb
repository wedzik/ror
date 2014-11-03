class Task1
  def initialize
    @m= Array.new(4){ Array.new(4){ rand(20)-10 } }
    @m.each{ |m| m.each{ |x| self.mPrint(x) }; puts }
  end

  def mPrint(x)
    print ' ' if(x >= 0)
    print ' ' if(x.abs < 10)
    print ' '+x.to_s
  end
end

t = Task1.new