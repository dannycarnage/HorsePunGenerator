require 'text'
require 'optparse'
sentence = 'May the force be with you'
OptionParser.new do |opts|
opts.banner = "Usage: SCRIPTNAME.rb [options]"
opts.on("--sentence VAL", String, "Sets the sentence to horsepun-ize") { |val| sentence = val }
opts.on("--help", "Prints this help") do |val| 
puts opts
exit
end
end.parse!
def horsepunize(sentence)
words = Array.new
File.open('wordlist').each { |l| words << l.chomp }
metawords = Array.new
output = Array.new
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
return output
end
puts(horsepunize(sentence))