require_relative 'userprofile.rb'
require 'json'
require 'pearson'
p user_arr.count
jsonfile = File.read("data/data/user_song_matrix.json")
data = JSON.parse(jsonfile)
p Pearson.coefficient(data,'user_000007','user_000007')