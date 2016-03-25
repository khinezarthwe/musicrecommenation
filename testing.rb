require 'json'
require 'pearson'
require 'csv'
require_relative 'userprofile.rb'

module Music
  module Pearsoncorrelation_1
    def self.main
      data = File.read("data/data/user_song_matrix.json")
      pearsoncorrelation_1 data
      output
    end
    def self.pearsoncorrelation_1 data
      usersimilarity = {}
      user_arr.each do |user_data|
        usersimilarity[user_data] = Pearson.closest_entities(JSON.parse(data),user_data,limit:20)
      end
    end
    def self.output
      CSV.open("similarity.csv" ,"w") do |csvobject|
        usersimilarity.values.each do |row_arr|
          csvobject << row_arr
        end
      end
    end
  end
end

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
