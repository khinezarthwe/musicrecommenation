#<<<<<<<pearsoncorrelation_1.rb   _________________
# I crawel the lyric with using ruby gem lyricfy . but some file are not format like (onThe seeYou)
# I write these file for solving these kinds for problem
require 'rubygems'
require 'bundler/setup'
module Music
  module Textpreparinglyric
    def self.main
      Dir.foreach('data/data/lyricdata/') do |filename|
        next if filename == '.' or filename == '..'
        file =  File.read('data/data/lyricdata/' + filename)
        p filename
        result_arr = process file
        output(result_arr,filename)
      end
    end
    def self.process file
      text_arr = file.split
      word_list = []
      text_arr.each do |word|
        test_ans = word.split /(?=[A-Z])/
		word_list += test_ans 
	  end
	  word_list
    end
    def self.output(result_arr,filename)
    	File.open('data/data/lyricdata/'+ filename,'w') {|f| f.write(result_arr.join(" "))}
    end
  end
end
Music::Textpreparinglyric.main