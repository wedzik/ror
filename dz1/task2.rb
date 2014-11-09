class Task2
  def initialize(size = 40)
    @avTempHash = Hash.new()
    @avTempArray = Array.new(12){Array.new()}
    @endTime = Time.now;
    @startTime = @endTime - 31536000;
    @dates= Array.new(size){ |x| "#{rand(@startTime..@endTime).strftime("%d.%m")} #{(rand(-30..40))}"}
    10.times do
      @dates += @dates;
    end
    puts "Data size= #{@dates.size}"
  end

  def m_print(x)
    print ' ' if(x >= 0)
    print ' ' if(x.abs < 10)
    print ' '+x.to_s
  end

  def show_dates
    @dates.each{ |x| puts(x) }
  end

  #return average temp from given Array @m
  def calc_average_temp(m)
    sum = m.inject(0, :+)
    if m.size > 0
      avTemp = sum/ m.size.to_f
      puts "\t Average Temp. =  %.2f" % [avTemp]
    else
      puts
    end
     avTemp
  end

  def parse_month_to_hash(x)
    data = x.to_s.split(' ')
    monthNumber = data[0].split('.')[1].to_i   #get month number
    if @avTempHash.has_key?(monthNumber)
      @avTempHash[monthNumber].push(data[1].to_i)
    else
      @avTempHash[monthNumber] = Array(data[1].to_i)
    end
  end

  def parse_month_to_array(x)
    data = x.to_s.split(' ')
    monthNumber = data[0].split('.')[1].to_i   #get month number
    @avTempArray[monthNumber-1] << data[1].to_i
  end

  def get_av_temps_hash
    @dates.each{ |x| self.parse_month_to_hash(x) }
    @avTempHash.each_key{ |key| print "#{key} :\t"; @avTempHash[key] = calc_average_temp(@avTempHash[key]) }
    @avTempHash
  end

  def get_av_temps_array
    @dates.each{ |x| self.parse_month_to_array(x) }
    @avTempArray.each_index { |index| print "#{index+1} :\t"; @avTempArray[index] = calc_average_temp(@avTempArray[index]) }
    @avTempArray
  end
end
start0 = Time.now
puts "App work start: #{start0}"
t = Task2.new(1000)
stop0 = Time.now
puts "Create data work stop: #{stop0} Duration: #{stop0 - start0} seconds"
#t.show_dates
start1 = Time.now
puts "Array work start: #{start1}"
t.get_av_temps_array
stop1 = Time.now
puts "Array work stop: #{stop1} Duration: #{stop1 - start1} seconds"
puts "________________________________________________"
start2 = Time.now
puts "Hash work start: #{start2}"
t.get_av_temps_hash
stop2 = Time.now
puts "Hash work stop: #{stop2} Duration: #{stop2 - start2} seconds"