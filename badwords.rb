# Badwords Script
# CSC 300 Professional Responsiblities
# Developed by
#   Ian Mitchell
#   Nick Reiter - Regex Help

def usage
  puts "Usage: $ ruby badwords.rb <proposal.tex> <badwords.txt>"
  exit
end


FILE = ARGV[0] || "proposal.tex"
LIST = ARGV[1] || "badwords.txt"
WORDS = []


begin
  f = File.open(FILE)
rescue
  puts "Unable to open paper"
  usage
end

begin
  l = File.open(LIST)
rescue
  puts "Unable to open badwords."
  usage
end


File.read(LIST).each_line do |line|
  WORDS << line.chop
end



File.readlines(FILE).each_with_index do |val, index|
  WORDS.each do |word|
    if val =~ /\b#{Regexp.escape(word)}\b/i
      puts "\nYour paper contains \"#{word}\" on line #{index + 1}" # Offset by 1 because 0.
      puts "#{val}\n\n"
    end
  end
end

puts "Finished checking."
