#<< creatingmatrix.rb ................... dataforlyricsearch.rb>>
# based on the user song frequency matrix I selected top 5000 songs for 1000 user with 
# most listening frequencies.
require 'rubygems'
require 'csv'
result_hash = {}
count = 0
data = CSV.read('data/data/merging/user_000100.csv',headers: true)
song_id = data.headers
song_id.each do |col_name|
	result_hash[col_name] = data[col_name].compact.count
	p col_name
end
#p result_hash.count
CSV.open("data/data/merging/popularsong.csv" , "w") do |csvobject|
  result_hash.sort_by(&:first).each do |row_arr|
    csvobject << row_arr
  end
end