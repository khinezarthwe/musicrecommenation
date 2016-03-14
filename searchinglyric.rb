##<< dataforlyricsearch.rb .......................lyricdatawithlda.rb------------>>
# searching lyrics and based on research clean remove short file and
# differnt languages. # still writing this file
require 'rubygems'
require 'bundler/setup'
require 'csv'
require 'lyricfy'
require 'whatlanguage'
data = CSV.read('data/adddata/song_id,artistname_song_name2.csv')
fetcher = Lyricfy::Fetcher.new
data.each do |songdata|
  begin
    song = fetcher.search songdata[1],songdata[2]
    File.open('data/lyricdata/'+songdata[0]+ '.txt', 'w') {|f| f.write(song.body('')) }
  rescue Exception => e
    File.open('data/nolyric/'+songdata[0]+ '.txt', 'w') {|f| f.write(e.message) }
  end
end

Dir.foreach('data/lyricdata/') do |filename|
	next if filename == '.' or filename == '..'
	file =  File.read('data/lyricdata/' + filename) 
	if file.length < 500
		File.delete('data/lyricdata/' + filename)
	end
end

#cleaning other songs
#w1 = WhatLanguage.new(:all)
#Dir.foreach('data/lyricdata/') do |filename|
#	next if filename == '.' or filename == '..'
#	file =  File.read('data/lyricdata/' + filename) 
#	if w1.language(file).to_s != 'english'
#		File.delete('data/lyricdata/' + filename)
#	end
#
#end

