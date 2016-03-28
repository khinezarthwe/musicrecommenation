#<<<<<< user_song_matrix.rb   ............... pearsoncorrelation_1.rb>>>>>>>>
# this file for calculation for pearson correlation between each user
# from the .json format file and using pearson ruby gem and I can get correfficient for 
# between user. 
# next file will be pearsoncorrelation_1.rb in my research i would like to test with all 
# four types of recommendations. 
# 1_ ## normal recommendation system with all data
# 2_ ## recommendation system with text processing
# 3_ ## normal recommendation system without text processing and using time specific 
# 4_ ## recommendaion system with text processing and reducing the time specific user :D

require 'json'
require 'pearson'
require 'csv2json'
require_relative 'userprofile.rb'

module Music
  module Csvtojson
    def self.main
      csvtojson
      jsonwithuser
    end
    def self.csvtojson
      File.open('data/data/user_song_matrix.csv', 'r') do |input|
        File.open('data/data/rawdata/rawjsondata.json', 'w') do |output|
          CSV2JSON.parse(input, output)
        end
      end
    end
    def self.jsonwithuser
      hashdata = {}
      data = File.read('data/data/rawdata/rawjsondata.json')
      jdata = JSON.parse data
      for i in 0..user_arr.length
        hashdata[user_arr[i]] = jdata[i]
      end
      File.open('data/data/user_song_matrix.json','w') {|file| file.write(hashdata.to_json)}
    end
  end
end

Music::Csvtojson.main