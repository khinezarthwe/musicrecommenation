#<< cleaning.rb ................ >> counting.rb
# seperating each user record by doing this we can get each user record can count
# the listening records for that
require 'rubygems'
require 'bundler/setup'
require 'csv'
require_relative 'userprofile'
tempdata = []
rawdata1 = CSV.read('data/data/rawdata/allrawdata.csv', col_sep: ",")
user_arr.each do |userid|
  rawdata1.each do |sep_user|
    if sep_user[0] == userid
      tempdata << sep_user
    end
    CSV.open('data/data/seperateuser/' + userid,"w") do |csvobject|
      tempdata.each do |row_arr|
        csvobject << row_arr
      end
    end

  end
  tempdata = []
end
