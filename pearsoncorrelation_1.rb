#<<<<<< user_song_matrix.rb   ..pearsoncorrelation_1.rb......textpreparinglyric.rb..........>>>>>>>>
# calculate the pearson correlation between the users 100 using pearson ruby gem

require 'bundler/setup'
require 'json'
require 'pearson'
require 'csv'
require_relative 'userprofile.rb'

module Music
  module Pearsoncorrelation_1
    def self.main
      jsonfile = File.read("data/data/user_song_matrix.json")
      data = JSON.parse(jsonfile)
      usersimilarity = pearsoncorrelation_1(data)
      output usersimilarity
    end
    def self.pearsoncorrelation_1 (data)
      pearsoncorrleation = []
      result_hash = {}
      user_arr.each do |row|
        user_arr.each do |col|
          pearsoncorrleation << Pearson.coefficient(data,row,col)
        end
        result_hash[row] = pearsoncorrleation
        pearsoncorrleation =[]
      end
      result_hash
    end
    def self.output result_hash
      CSV.open("data/data/pearsoncorrelation_1.csv" ,"w") do |csvobject|
        result_hash.each do |row_arr|
          csvobject << row_arr
        end
      end
    end
  end
end
#Music::Pearsoncorrelation_1.main
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
