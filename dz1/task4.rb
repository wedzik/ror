class Task4
  def initialize
    @findCount = 0;
    @h = {'yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5=> '234', :yesss => :fg,
          try: 30, key: 'some value', 'yesterday1'=> 34, 'yesteryear' => 2014};
    puts @h
  end

  def parseKey(key)
    key = key.to_s if (key.is_a? Symbol)
    if ( key =~ /\Ayes(.*?)/ )
      @findCount += 1
      puts @findCount.to_s+'. '+key.to_s
    end
  end

  def run
    @h.each_key{|key| parseKey(key)}
    puts "Found %d matches " % @findCount
  end
end

t = Task4.new
t.run