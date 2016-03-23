# ! start run from this file . data from Last.FM 1k user dataset. .....
# >>>>> sperateuser.rb
# cleaning file from raw data, remove nil column and remove different language
#extract 2009 listening record
require 'rubygems'
require 'bundler/setup'
require 'whatlanguage'
require_relative 'userprofile'
require 'csv'

module Music
  module Cleaning

    USERID_INDEX = 0
    LISTENING_TIMESTAMP_INDEX = 1
    ARTIST_INDEX = 2
    ARTIST_NAME = 3
    TRACKID_INDEX = 4
    TRACKNAME_INDEX = 5

    def self.cleaning_process data
      dataclean = []
      w1 = WhatLanguage.new(:all)
      testdate = DateTime.parse "2008-12-31T24:00:00Z"
      data.each do |sub_data|
        if sub_data[USERID_INDEX].nil? or sub_data[LISTENING_TIMESTAMP_INDEX].nil? or sub_data[ARTIST_INDEX].nil? or sub_data[ARTIST_NAME].nil? or sub_data[TRACKID_INDEX].nil? or sub_data[TRACKNAME_INDEX].nil?
          data.delete(sub_data)
        elsif w1.language(sub_data[ARTIST_NAME]).to_s == ''
          data.delete(sub_data)
        elsif DateTime.parse(sub_data[LISTENING_TIMESTAMP_INDEX]) > testdate
          dataclean << sub_data
        end
      end
      dataclean
    end
    def self.output dataclean
      CSV.open("data/data/rawdata.csv" , "w") do |csvobject|
        dataclean.each do |row_arr|
          csvobject << row_arr
        end
      end
    end
    def self.main
      dataclean = cleaning_process data
      output dataclean
    end

  end
end



#Music::Cleaning.main



=begin

#module 
dataclean = []
w1 = WhatLanguage.new(:all)
testdate = DateTime.parse "2008-12-31T24:00:00Z"
data.each do |sub_data|
  if sub_data[0].nil? or sub_data[1].nil? or sub_data[2].nil? or sub_data[3].nil? or sub_data[4].nil? or sub_data[5].nil?
    data.delete(sub_data)
  elsif w1.language(sub_data[3]).to_s == ''
    data.delete(sub_data)
  elsif DateTime.parse(sub_data[1]) > testdate
    dataclean << sub_data
  end
end

CSV.open("data/data/rawdata.csv" , "w") do |csvobject|
  dataclean.each do |row_arr|
    csvobject << row_arr
  end
end
=end
