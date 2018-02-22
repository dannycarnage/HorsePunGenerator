require 'text'
sentence = 'May the force be with you'
words = ['horse', 'hoof', 'hooves', 'horses']
metawords = []
output = []
white = Text::WhiteSimilarity.new
words.each do |w|
metawords.push(Text::Metaphone.metaphone(w))
end
sentence.split.each do |s|
metawords.each do |m|
if white.similarity(m, Text::Metaphone.metaphone(s)) > 0.3 then
tempsentence = sentence.split
tempsentence[sentence.split.index(s)] = words[metawords.index(m)]
output.push tempsentence.join(" ")
end
end
end
puts output
