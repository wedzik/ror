class Task2
  def initialize
    @m = Hash.new()
    @dates= Array.new(40){ |x| "#{rand((Time.now - 60*60*24*365)..Time.now).strftime("%d.%m")} #{(rand(50)-20)}"}
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
      avTemp = sum/ m.size.to_f
      puts "\t Average Temp. =  %.2f" % [avTemp]
    end
     avTemp
  end

  def parseMonth(x)
    data = x.to_s.split(' ')
    monthNumber = data[0].split('.')[1].to_i   #get month number
    if @m.has_key?(monthNumber)
      @m[monthNumber].push(data[1].to_i)
    elsif
      @m[monthNumber] = Array(data[1].to_i)
    end
  end

  def getAvTemps
    puts
    @dates.each{ |x| self.parseMonth(x) }
    @m.each_key{ |key| print "#{key} :\t";@m[key].each{ |x| self.mPrint(x) }; @m[key] = calcAverageTemp(@m[key]) }
    @m
  end
end

t = Task2.new
puts t.getAvTemps