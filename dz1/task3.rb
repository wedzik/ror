class Task3
  def initialize
    @m = Array.new(12){ Array.new() }
    @dates= Array.new(40){ |x| rand((Time.now - 60*60*24*365)..Time.now).strftime("%d.%m")+' '+(rand(50)-20).to_s }
    @dates.each{ |x| puts(x) }
  end

  def mPrint(x)
    print ' ' if(x >= 0)
    print ' ' if(x.abs < 10)
    print ' '+x.to_s
  end

  def calcAverageTemp(m)
    sum = m.inject(0, :+)
    if m.size > 0
      puts "\t Average Temp. =  %.2f" % [sum/ m.size.to_f]
    end
  end

  def parseMonth(x)
    d = x.to_s.split(' ')
    date = d[0].to_s.split('.')
    @m[date[1].to_i-1].push(d[1].to_i)
  end

  def run
    puts
    @dates.each{ |x| self.parseMonth(x) }
    @m.each{ |m| m.each{ |x| self.mPrint(x) }; calcAverageTemp(m) }
  end
end

t = Task3.new
t.run