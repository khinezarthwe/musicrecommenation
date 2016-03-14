# ! start run from this file . data from Last.FM 1k user dataset. .....
# >>>>> sperateuser.rb
# cleaning file from raw data, remove nil column and remove different language
#extract 2009 listening record
require 'rubygems'
require 'bundler/setup'
require 'whatlanguage'
require_relative 'userprofile'
require 'csv'
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
