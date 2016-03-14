##<< selectingpopularsong.rb ................... searchinglyric.rb>>
## I would like to used lyricfy lyric search gem so , I need song name and author 
## for this gems, this scrpit take the top popular song 5000's title name and 
# singer name! 
require 'csv'
result_arr = []
dataheader = []
songdata = File.open('data/data/merging/popularsong.csv')
topsongs = songdata.first(6000)
topsongs.each do |first_col|
  dataheader << first[0]
end
Dir.foreach('data/data/seperateuser/') do |user_hash|
  next if user_hash == '.' or user_hash == '..'
  data = CSV.read('data/data/seperateuser/' + user_hash, col_sep: ",")
  data.each do |check|
    dataheader.each do |test|
      if check[4] == test
        result_arr << [[check[4]],check[3],check[5]]
      end
    end

  end
end

CSV.open("data/data/songname_artistname.csv" ,"w") do |csvobject|
  result_arr.uniq.each do |row_arr|
    csvobject << row_arr
  end
end