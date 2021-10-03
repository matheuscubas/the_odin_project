dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


def substrings (string, array)

  text = string.downcase
  result = {}

  array.each do |word|
    matches = text.scan(word).length
    result[word] = matches unless matches == 0
  end
  return result
end

=begin
def substrings(string, array)
  result = {}
  text = string.downcase.split(' ')

  array.each do |key|
   text.each do |word|
    if word.include?(key)
      result.key?(key) ? result[key] += 1 : result[key] = 1
    end
   end
  end
  return result
end
=end

substrings("Howdy partner, sit down! How's it going?", dictionary)