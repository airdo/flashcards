# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



require 'open-uri'
puts 'Parsing started'
doc=Nokogiri::HTML(open('http://www.101languages.net/russian/russian-word-list/'))

@words  = doc.css("tr[dir='ltr']").map { |wrd|
 original_text = wrd.css(".s2").text.split("(").first.to_s.strip
 translated_text = wrd.css(".s3").text.split("(").first.to_s.strip
 
 {original_text: original_text,
  translated_text: translated_text
 }
}
puts 'Sending data to table'
@words.each do |word|
  Card.create( original_text: word[:original_text], translated_text: word[:translated_text])
end
len = @words.length 
puts 'Done! Words sent: '+len.to_s