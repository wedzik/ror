class DictionarySearch
  def initialize(file_path)
    @data = Hash.new
    @word_pairs = Array.new()
    File.open(file_path, 'r').each_line do |line|
      line.strip!
      if line.size > 2
        key = line.chop.chop!
        if @data.has_key?(key)
          @data[key].push(line)
        else
          @data[key] = Array(line)
        end
      end
    end
  end

  def search_pair(arr, w)
    w2 = String.new(w)
    t = w2[-2]
    w2[-2] = w2[-1]
    w2[-1] = t
    if w != w2 && arr.include?(w2)
      @word_pairs << [w,w2] if !@word_pairs.include?([w,w2])
      arr.delete(w2)
    end
  end

  def collect_pairs
    @data.each_key { |key| @data[key].each{ |w| search_pair( @data[key], w) }}
  end

  def word_pairs
    collect_pairs
    return @word_pairs
  end
end

# dict = DictionarySearch.new("./wordsEn.txt")
# pairs =  dict.word_pairs
# puts "Found #{pairs.count}"