require 'rubygems'
require 'bundler/setup'
module Music
  module Textpreparinglyric
    def self.main
      Dir.foreach('data/data/testing/') do |filename|
        next if filename == '.' or filename == '..'
        file =  File.read('data/data/testing/' + filename)
        result_arr = process file
        output(result_arr,filename)
      end
    end
    def self.process file
      file.slice!("Khine")
      p file
      #text_arr = file.split
      #word_list = []
      #text_arr.each do |word|
      #  test_ans = word.split /(?=[A-Z])/
		#word_list += test_ans 
	  #end
	  #word_list
    end
    def self.output(result_arr,filename)
    	#File.open('data/data/testing/'+ filename,'w') {|f| f.write(result_arr.join(" "))}
    end
  end
end
Music::Textpreparinglyric.main