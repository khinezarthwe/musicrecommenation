#<<<<<< countring.rb ...........  selectingpopularsong.rb>>>>>
# merging all the file the first result to merging folder and add again with
#counting folder
# by doing this I can get the user listeing metrix for all data
require 'rubygems'
require 'bundler/setup'
require 'csv'
module Music
  module Usersong_matrix
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
    # users_ 100 as rows and songs as column
    # data from counting results of each song per user

    def self.input (filename,intial_data)
      currentdata = CSV.read('data/data/counting/'+ filename, headers: true)
      if currentdata.size == 0 then
        headers = intial_data.headers
        body    = headers.map {|h| nil }
        CSV.open('data/data/counting/' + filename, "w") do|csvobject|
          csvobject << headers
          csvobject << body
        end
        currentdata = CSV.read('data/data/counting/'+ filename, headers: true)
      end
      currentdata
    end
    def self.output (mastercsv,count)
      mastercsv_arr = CSV.parse(mastercsv)
      CSV.open("data/data/merging/"+ count.to_s + '.csv',"w") do |csvobject|
        mastercsv_arr.each do |row_arr|
          csvobject << row_arr
        end
      end
    end
    def self.making_matrix(intial_data,count)
      Dir.foreach('data/data/counting/').sort.each do |filename|
        next if filename == '.' or filename == '..' or filename == 'user_00001.csv'
        p filename
        currentdata = input(filename,intial_data)
        mastercsv = merge(intial_data,currentdata)
        output(mastercsv,count)
        intial_data = CSV.read('data/data/merging/'+ count.to_s + '.csv', headers: true)
        count += 1
      end
    end
    def self.main
      intial_data = CSV.read('data/data/counting/user_000001.csv', headers: true)
      count = 2
      making_matrix(intial_data,count)
    end
  end

end

#Music::Usersong_matrix.main

=begin
  

  

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

Dir.foreach('data/data/counting/').sort.each do |filename|
  next if filename == '.' or filename == '..' or filename == 'user_00001.csv'
  p filename
  currentdata = CSV.read('data/data/counting/'+ filename, headers: true)
  if currentdata.size == 0 then
    headers = intial_data.headers
    body    = headers.map {|h| nil }
    CSV.open('data/data/counting/' + filename, "w") do|csvobject|
      csvobject << headers
      csvobject << body
    end
    currentdata = CSV.read('data/data/counting/'+ filename, headers: true)
  end
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

=end
