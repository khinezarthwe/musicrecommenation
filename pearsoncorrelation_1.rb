require 'bundler/setup'
require 'json'
require 'pearson'
require 'csv'
require_relative 'userprofile.rb'

module Music
  module Pearsoncorrelation_1
    NUMBER_OF_USER = user_arr.count + 1
    def self.main
      data = File.read("data/data/user_song_matrix.json")
      usersimilarity = pearsoncorrelation_1(data,user_arr)
      output usersimilarity
    end
    def self.pearsoncorrelation_1 (data,user_arr)
      usersimilarity = {}
      user_arr.each do |user_data|
        usersimilarity[user_data] = Pearson.closest_entities(JSON.parse(data),user_data,limit:20)
      end
      usersimilarity
    end
    def self.output usersimilarity
      CSV.open("pearsoncorrelation_1.csv" ,"w") do |csvobject|
        usersimilarity.values.each do |row_arr|
          csvobject << row_arr
        end
      end
    end
  end
end
Music::Pearsoncorrelation_1.main
=begin

usersimilarity = {}
data = File.read("hashoutput.json")
user_arr.each do |user_data|
  usersimilarity[user_data] = Pearson.closest_entities(JSON.parse(data),user_data,limit:20)
end


#p usersimilarity['user_3'][1][1]
CSV.open("similarity.csv" ,"w") do |csvobject|
  usersimilarity.values.each do |row_arr|
    csvobject << row_arr
  end
end
#File.open('similarity.json','w') {|file| file.write(usersimilarity.to_json)}
=end
