class Task3
  def initialize
    @findCount = 0
    @keys = Array.new()
    @h = {'yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5=> '234', :yesss => :fg,
          try: 30, key: 'some value', 'yesterday1'=> 34, 'yesteryear' => 2014}
    puts @h
  end

  def parseKey(key)
    key = key.to_s if (key.is_a? Symbol)
    if ( key =~ /\Ayes(.*?)/ )
      @findCount += 1
      @keys.push(key)
    end
  end

  def find
    @h.each_key{|key| parseKey(key)}
    puts "Found #@findCount matches"
    @keys
  end
end

t = Task3.new
puts t.find