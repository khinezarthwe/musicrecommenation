require 'csv'
hashtopic_data = {}
data = CSV.read('data/LDA_topic_result/ldaresultforsong_topic_10.csv').to_a.transpose
data.each do |topicdata|
  hashtopic_data[topicdata[0]] = topicdata.drop(1).each_with_index.max
end
CSV.open("data/LDA_topic_result/ldaresulttopic_10.csv" ,"w") do |csvobject|
  hashtopic_data.each do |row_arr|
    csvobject << row_arr
  end
end
