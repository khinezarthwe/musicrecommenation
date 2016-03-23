#<< creatingmatrix.rb ................... dataforlyricsearch.rb>>
# based on the user song frequency matrix I selected top 5000 songs for 1000 user with
# most listening frequencies.
require 'rubygems'
require 'csv'
module Music
  module Selectingpopularsong
    def self.input
      data = CSV.read('data/data/merging/101.csv',headers: true)

    end
    def self.output result_hash
      CSV.open("data/data/merging/popularsong.csv" , "w") do |csvobject|
        result_hash.sort_by(&:first).each do |row_arr|
          csvobject << row_arr
        end
      end
    end
    def self.selecting data
      result_hash = {}
      count = 0
      song_id = data.headers
      song_id.each do |col_name|
        result_hash[col_name] = data[col_name].compact.count
        p col_name
      end
      result_hash
    end
    def self.main
      result_hash = selecting(input)
      output result_hash
    end
  end
end
#Music::Selectingpopularsong.main

=begin
  

  

result_hash = {}
count = 0
data = CSV.read('data/data/merging/101.csv',headers: true)
song_id = data.headers
song_id.each do |col_name|
  result_hash[col_name] = data[col_name].compact.count
  p col_name
end
CSV.open("data/data/merging/popularsong.csv" , "w") do |csvobject|
  result_hash.sort_by(&:first).each do |row_arr|
    csvobject << row_arr
  end
end
=end
