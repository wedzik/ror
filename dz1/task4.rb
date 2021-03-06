class Task4
  def initialize
    @newHash =  {'yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234',
           :yesss => :fg, try: {'yesterday11' => 34, 'yesteryear' => 2014},
           key: [{'yes' => 23, 'b' => 'travel'}], 'yesterday1' => 34,
           'yesteryear' => 2014};
    puts @newHash
  end

  def parseKey(h, key)
    if (key.is_a? String)
      newKey = key.to_sym
      h[newKey] = h[key]
      h.delete(key)
    end
  end

  def parseValue(val)
    if (val.is_a? Hash)
      val.values.each{ |v| parseValue(v) }
      val.keys.each{ |key| parseKey(val, key) }
    elsif (val.is_a? Array)
      val.each{ |v| parseValue(v) }
    end
  end

  def run
    parseValue(@newHash)
    @newHash
  end
end

t = Task4.new
puts
puts t.run