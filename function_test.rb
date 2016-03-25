require 'minitest/autorun'
require_relative '/home/kzt/Documents/Project_2/music_erecommendation_v_2/counting.rb'
require_relative '/home/kzt/Documents/Project_2/music_erecommendation_v_2/cleaning.rb'
require_relative '/home/kzt/Documents/Project_2/music_erecommendation_v_2/seprateuser.rb'
require_relative '/home/kzt/Documents/Project_2/music_erecommendation_v_2/pearsoncorrelation_1.rb'



describe Music::Counting do
  it "increases count if 4th value of record is present" do
    ary = [['dc', 'dc', 'dc','dc', 'main'],['dc', 'dc', 'dc','dc', nil],['dc','dc', 'dc', 'dc', 'main']]
    result = Music::Counting.process_data ary
    result.must_equal({'main' => 2})
  end
end

describe Music::Cleaning do
  it "Removing null data and select only timestamp over 2009 listening songs and english language" do
    data = [['user_000001',
             '2009-05-03T15:48:25Z',
             'ba2f4f3b-0293-4bc8-bb94-2f73b5207343',
             'Underworld',
             'dc394163-2b78-4b56-94e4-658597a29ef8',
             "Boy, Boy, Boy (Switch Remix)"],
            ['user_000001',
             '2008-05-03T15:48:25Z',
             'ba2f4f3b-0293-4bc8-bb94-2f73b5207343',
             'Underworld',
             'dc394163-2b78-4b56-94e4-658597a29ef8',
             "Boy, Boy, Boy (Switch Remix)"],
            ['user_000001',
             '2009-05-03T15:48:25Z',
             'ba2f4f3b-0293-4bc8-bb94-2f73b5207343',
             '',
             'dc394163-2b78-4b56-94e4-658597a29ef8',
             "Boy, Boy, Boy (Switch Remix)"]]

    result = Music::Cleaning.cleaning_process data
    result.must_equal([['user_000001',
                        '2009-05-03T15:48:25Z',
                        'ba2f4f3b-0293-4bc8-bb94-2f73b5207343',
                        'Underworld',
                        'dc394163-2b78-4b56-94e4-658597a29ef8',
                        "Boy, Boy, Boy (Switch Remix)"],
                       ])
  end
end

describe Music::Seperating do
  it "Seperating each user for each data record" do
    tempdata = []
    user_arr = ['user_01','user_02']
    smallrawdata = [['user_01', 'dc', 'dc','dc', 'main'],
                    ['user_01', 'dc', 'dc','dc', nil],
                    ['user_02','dc', 'dc', 'dc', 'main'],
                    ['user_02','dc', 'dc', 'dc', 'main']]
    result = Music::Seperating.seperateuser(user_arr[2],smallrawdata[0],tempdata)
    result.must_equal([])
    #result.must_equal([['user_01', 'dc', 'dc','dc', 'main']])
  end
end

describe Music::Pearsoncorrelation_1 do
  it "calculating the pearson correlation between each user using ruby gem 'pearson'" do
    data = File.read("data/data/testing/correlation.json")
    user_arr = ['user_000001','user_000002']
    #NUMBER_OF_USER = user_arr.count + 1
    result = Music::Pearsoncorrelation_1.pearsoncorrelation_1(data,user_arr)
    result.must_equal('1')
  end
end
