### after searching the lyric for each songs of popular songs we recreate the user_song 
### matrix for calculating the correlation and recommendation for users
### this matrix is for final user_item matrix 
require 'csv'
popularsongid = []
REMOVE_FILE_EXTENSION = '.txt'
data = CSV.read('data/data/merging/101.csv' , headers: true)

Dir.foreach('data/data/lyricdata/') do |p_songid|
	next if p_songid == '.' or p_songid == '..'
	popularsongid << p_songid.chomp(REMOVE_FILE_EXTENSION)
end

deldata = data.headers - popularsongid
deldata.each do |del_val|
	p del_val
	data.delete(del_val)
end

CSV.open("data/data/user_song_matrix.csv" ,"w") do |csvobject|
  csvobject << data.headers
  data.each do |row_arr|
    csvobject << row_arr
  end
end