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
output = Array.new
sentence.split.each do |s|
words.each do |m|
if s.length > 3 and Text::Levenshtein.distance(m, s) < 3 then
tempsentence = sentence.split
tempsentence[sentence.split.index(s)] = words[words.index(m)]
output.push tempsentence.join(" ")
end
end
end
return output
end
puts(horsepunize(sentence))