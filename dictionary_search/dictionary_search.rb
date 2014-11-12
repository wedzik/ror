#require 'benchmark'
class DictionarySearch
  def initialize(file_path)
    @data = Hash.new
    @word_pairs = Array.new()
    lines = File.readlines(file_path)
    lines.each do |line|
      line.strip!
      if line.size > 2 && line[-1] != line[-2]
        key = line.chop.chop!
        @data[key] ||=  Array.new()
        @data[key] << line
      end
    end
  end

  def search_pair(arr, w)
    w2 = "#{w[0..-3]}#{w[-1]}#{w[-2]}"
    if arr.include?(w2)
      @word_pairs << [w,w2]
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

# Benchmark.bm() do |x|
#    x.report("Search" ) {
#       dict = DictionarySearch.new("./wordsEn.txt")
#       pairs =  dict.word_pairs
#       puts "Found #{pairs.count}"
#   }
# end




