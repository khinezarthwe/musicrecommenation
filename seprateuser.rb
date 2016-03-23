#<< cleaning.rb ................ >> counting.rb
# seperating each user record by doing this we can get each user record can count
# the listening records for that
require 'rubygems'
require 'bundler/setup'
require 'csv'
require_relative 'userprofile'
module Music
  module Seperating
    #USERIDFROM_PROFILE =  user_arr
    #RAWDATA_FOR_USER = smallrawdata
    USERID_INDEX = 0
    def self.output (tempdata,userid)
      CSV.open('data/data/seperateuser/' + userid,"w") do |csvobject|
        tempdata.each do |row_arr|
          csvobject << row_arr
        end
      end
    end
    def self.seperateuser (userid,sep_user,tempdata)
      if sep_user[USERID_INDEX] == userid
        tempdata << sep_user
      end
      tempdata

    end

    def self.main
      tempdata = []
      user_arr.each do |userid|
        smallrawdata.each do |sep_user|
          tempdata =seperateuser(userid,sep_user,tempdata)
          
        end
        output(tempdata,userid)
        tempdata = []
      end


    end


  end
end
#Music::Seperating.main


=begin

  smallrawdata = CSV.read('data/data/rawdata/allrawdata.csv', col_sep: ",")
  user_arr.each do |userid|
    smallrawdata.each do |sep_user|
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
=end
