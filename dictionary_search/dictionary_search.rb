require 'benchmark'
class DictionarySearch1
  def initialize(file_path)
    @data = Hash.new
    @word_pairs = Array.new()
    lines = File.readlines(file_path)
    lines.each do |line|
      line.strip!
      if line.size > 2 && line[-1] != line[-2]
        key = line[0..-3]
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

class DictionarySearch0
  def initialize(file_path)
    @data = Hash.new
    @word_pairs = Array.new()
    lines = File.readlines(file_path).uniq
    lines.each do |w1|
      w1.strip!
      if w1.size > 2 && w1[-1] != w1[-2]
        w2 = get_swiched(w1)
        if @data.has_key?(w2)
          @word_pairs << [w1,w2]
          @data.delete(w2)
        elsif
          @data[w1] = w1
        end
      end
    end
  end

  def get_swiched(w)
    "#{w[0..-3]}#{w[-1]}#{w[-2]}"
  end

  def word_pairs
    return @word_pairs
  end
end

class DictionarySearch2
  def initialize(file_path)
    @word_pairs = Array.new()
    @data = Hash[File.read(file_path).split("\n").uniq.map{|v| [v.strip, v.strip]}]
    @data.each_key do |key1|
      if key1 && key1.size > 2 && key1[-1] != key1[-2]
        key2 = get_swiched(key1)
        if @data.has_key?(key2)
          @word_pairs << [key1,key2]
          @data.delete(key2)
          @data.delete(key1)
        end
      end
    end
  end

  def get_swiched(w)
    "#{w[0..-3]}#{w[-1]}#{w[-2]}"
  end

  def word_pairs
    return @word_pairs
  end
end

# Benchmark.bm() do |x|
#   x.report("ruslan_:") {
#     dict = DictionarySearch0.new("./wordsEn.txt")
#     pairs =  dict.word_pairs
#   }
#
#   x.report("wedzik1:") {
#     dict = DictionarySearch1.new("./wordsEn.txt")
#     pairs =  dict.word_pairs
#   }
#
#   x.report("wedzik2:") {
#     dict = DictionarySearch2.new("./wordsEn.txt")
#     pairs =  dict.word_pairs
#   }
# end
#
# Benchmark.bm() do |x|
#   x.report("ruslan_:") {
#     dict = DictionarySearch0.new("./wordsEn_1ml.txt")
#     pairs =  dict.word_pairs
#   }
#
#   x.report("wedzik1:") {
#     dict = DictionarySearch1.new("./wordsEn_1ml.txt")
#     pairs =  dict.word_pairs
#   }
#
#   x.report("wedzik2:") {
#     dict = DictionarySearch2.new("./wordsEn_1ml.txt")
#     pairs =  dict.word_pairs
#   }
# end
#
# Benchmark.bm() do |x|
#   x.report("ruslan_:") {
#     dict = DictionarySearch0.new("./wordsEn_10ml.txt")
#     pairs =  dict.word_pairs
#   }
#
#   x.report("wedzik1:") {
#     dict = DictionarySearch1.new("./wordsEn_10ml.txt")
#     pairs =  dict.word_pairs
#   }
#
#   x.report("wedzik2:") {
#     dict = DictionarySearch2.new("./wordsEn_10ml.txt")
#     pairs =  dict.word_pairs
#   }
# end


