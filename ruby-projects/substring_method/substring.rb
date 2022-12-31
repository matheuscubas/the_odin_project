# frozen_string_literal: true

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(string, array)
  text = string.downcase
  result = {}

  array.each do |word|
    matches = text.scan(word).length
    result[word] = matches unless matches.zero?
  end
  result
end

# def substrings(string, array)
#   result = {}
#   text = string.downcase.split(' ')
#
#   array.each do |key|
#    text.each do |word|
#     if word.include?(key)
#       result.key?(key) ? result[key] += 1 : result[key] = 1
#     end
#    end
#   end
#   return result
# end

substrings("Howdy partner, sit down! How's it going?", dictionary)
