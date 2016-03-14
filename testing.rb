
#<<<<<< countring.rb ...........  selectingpopularsong.rb>>>>>
# merging all the file the first result to merging folder and add again with 
#counting folder 
# by doing this I can get the user listeing metrix for all data
require 'rubygems'
require 'bundler/setup'
require 'csv'

def self.merge(csv_1,csv_2)
  headers = (csv_1.headers + csv_2.headers).uniq.sort

  hash_array = [csv_1, csv_2].flat_map &method(:csv_to_hash_array)

  CSV.generate do |merged_csv|
    merged_csv << headers

    hash_array.each do |row|
      merged_csv << row.values_at(*headers)
    end
  end
end
def self.csv_to_hash_array(csv)
  csv.to_a[1..-1].map do |row|
    Hash[csv.headers.zip(row)]
  end
end
intial_data = CSV.read('data/data/counting/user_000001.csv', headers: true)
count = 2
allfilename = []
Dir.foreach('data/data/counting/') do |filename|
 allfilename << filename
end 
p allfilename.sort
Dir.foreach('data/data/counting/') do |filename|
  next if filename == '.' or filename == '..' or filename == 'user_00001.csv'
  currentdata = CSV.read('data/data/counting/'+ filename, headers: true)
  mastercsv = merge(intial_data,currentdata)
  mastercsv_arr = CSV.parse(mastercsv)
  CSV.open("data/data/merging/"+ count.to_s + '.csv',"w") do |csvobject|
    mastercsv_arr.each do |row_arr|
      csvobject << row_arr
    end
    
  end
  intial_data = CSV.read('data/data/merging/'+ count.to_s + '.csv', headers: true)
  count += 1
end
