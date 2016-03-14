require 'minitest/autorun'
require_relative 'data/counting.rb'


describe Music::Counting do
  it "increases count if 4th value of record is present" do
    ary = [['dc', 'dc', 'dc','dc', 'main'],['dc', 'dc', 'dc','dc', nil],['dc','dc', 'dc', 'dc', 'main']]
    result = Music::Counting.process_data ary
    result.must_equal({'main' => 2})
  end
end