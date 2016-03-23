require 'csv'
def user_arr
  user_arr = []
  userdata = CSV.read('data/userid_profile.tsv',col_sep: "\t", headers: true)
  userdata.each do |userarr|
    user_arr << userarr[0]
  end
  return user_arr
end

def data
  data = []
  totaldata = []
  Dir.foreach('data/last_fm_data/') do |filename|
    next if filename == '.' or filename == '..' or filename == '.DS_Store'
    data = CSV.read('data/last_fm_data/' + filename , col_sep: "\t")
    totaldata = totaldata + data
  end
  return totaldata
end

def rawdata
  data = []
  totaldata = []
  Dir.foreach('data/data/rawdata/') do |filename|
    next if filename == '.' or filename == '..' or filename == '.DS_Store'
    data = CSV.read('data/data/rawdata/' + filename , col_sep: "\t")
    totaldata = totaldata + data
  end
  return totaldata
end

def smallrawdata
   smallrawdata = CSV.read('data/data/rawdata/allrawdata.csv', col_sep: ",")
   return smallrawdata
end

def countingdata
  
end