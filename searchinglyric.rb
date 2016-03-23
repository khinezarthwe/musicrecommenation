##<< dataforlyricsearch.rb .......................lyricdatawithlda.rb------------>>
# searching lyrics and based on research clean remove short file and
# differnt languages.
require 'rubygems'
require 'bundler/setup'
require 'csv'
require 'lyricfy'
require 'whatlanguage'
module Music
  module Searchinglyric
    SONGID_INDEX = 0
    ARTIST_INDEX = 1
    SONGNAME_INDEX = 2
    def self.input
      data = CSV.read('data/data/songname_artistname.csv')
    end
    def self.output

    end
    def self.searchlyric data
      fetcher = Lyricfy::Fetcher.new
      data.each do |songdata|
        begin
          song = fetcher.search songdata[ARTIST_INDEX],songdata[SONGNAME_INDEX]
          File.open('data/data/lyricdata/'+songdata[SONGID_INDEX]+ '.txt', 'w') {|f| f.write(song.body('')) }
        rescue Exception => e
          File.open('data/data/lyricdata/nolyric/'+songdata[SONGID_INDEX]+ '.txt', 'w') {|f| f.write(e.message) }
        end
      end
    end
    def self.cleaning
      Dir.foreach('data/lyricdata/') do |filename|
        next if filename == '.' or filename == '..'
        file =  File.read('data/lyricdata/' + filename)
        if file.length < 500
          File.delete('data/lyricdata/' + filename)
        end
      end

      #cleaning other songs
      w1 = WhatLanguage.new(:all)
      Dir.foreach('data/lyricdata/') do |filename|
        next if filename == '.' or filename == '..'
        file =  File.read('data/lyricdata/' + filename)
        if w1.language(file).to_s != 'english'
          File.delete('data/lyricdata/' + filename)
        end
      end
    end
    def self.main
      searchlyric input
      cleaning
    end
  end
end

#Music::Searchinglyric.main
=begin
  


data = CSV.read('data/data/songname_artistname.csv')
fetcher = Lyricfy::Fetcher.new
data.each do |songdata|
  begin
    song = fetcher.search songdata[1],songdata[2]
    File.open('data/data/lyricdata/'+songdata[0]+ '.txt', 'w') {|f| f.write(song.body('')) }
  rescue Exception => e
    File.open('data/data/lyricdata/nolyric/'+songdata[0]+ '.txt', 'w') {|f| f.write(e.message) }
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
w1 = WhatLanguage.new(:all)
Dir.foreach('data/lyricdata/') do |filename|
  next if filename == '.' or filename == '..'
  file =  File.read('data/lyricdata/' + filename)
  if w1.language(file).to_s != 'english'
    File.delete('data/lyricdata/' + filename)
  end
end
=end