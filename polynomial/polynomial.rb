class Polynomial
  def initialize(elements=[])
    if elements.count <2
      raise ArgumentError, "Two or more coefficients are required"
    end
    @exp = '+'
    elements.reverse .each_with_index { |value, index | add_to_polynom(index, value)}
    @exp.sub!('x^0','')
    @exp.sub!('x^1+','x+')
    @exp.sub!('x^1-','x-')
    @exp.sub!('-1x','-x')
    @exp.sub!('+1x','+x')
    @exp[0] = '' if @exp[0] == '+'
    @exp[@exp.size-1] = '' if @exp[@exp.size-1] == '+'
  end

  def add_to_polynom(index, value)
    if value != 0
      @exp = value.to_s+'x^'+index.to_s+@exp
      @exp = '+'+@exp if value >0
    else
      @exp
    end
  end

  def to_s
    if @exp != ''
      @exp
    else
      '0'
    end
  end
end