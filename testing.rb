#<< seperateuser.rb ........>>> creatingmatrix.rb
#OK! counting the listening count for each song from this result we can construct the 
# user song matrix with the weight listenting frequency.
require 'rubygems'
require 'csv'

module Music
  module Counting

    SONG_NAME_INDEX = 4
  ##   [[dc, dc, dc, main],[dc, dc, dc, main],[dc, dc, dc, main]]
    def self.process_data data
      result_hash = {}
      data.each do|record|
        next if record[SONG_NAME_INDEX].nil?
        if result_hash[record[SONG_NAME_INDEX]].nil?
          result_hash[record[SONG_NAME_INDEX]] = 1
        else
          result_hash[record[SONG_NAME_INDEX]] += 1
        end
      end
      result_hash
    end

    def self.output result
      CSV.open("data/data/counting/" + user_name + '.csv',"w") do |csvobject|
        result = result.to_a.transpose
        result.each do |row_arr|
          csvobject << row_arr
        end
      end
    end

    def self.main
      Dir.foreach('data/data/seperateuser/') do |user_name|
        next if user_name == '.' or user_name == '..'
        input   = CSV.read('data/data/seperateuser/' + user_name, col_sep: ",")
        result = process_data input
        output result
      end
    end
  end
end
Music::Counting.main

require 'minitest/autorun'


describe Music::Counting do
  it "increases count if 4th value of record is present" do
    ary = [['dc', 'dc', 'dc','dc', 'main'],['dc', 'dc', 'dc','dc', nil],['dc','dc', 'dc', 'dc', 'main']]
    result = Music::Counting.process_data ary
    result.must_equal({'main' => 2})
  end
end