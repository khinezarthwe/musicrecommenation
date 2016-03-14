# << seperateuser.rb ........>>> creatingmatrix.rb
#OK! counting the listening count for each song from this result we can construct the 
# user song matrix with the weight listenting frequency.
require 'rubygems'
require 'csv'
Dir.foreach('data/data/seperateuser/') do |user_name|
  next if user_name == '.' or user_name == '..'
  data = CSV.read('data/data/seperateuser/' + user_name, col_sep: ",")
  result_hash = {}
  data.each do|record|
    next if record[4].nil?
    if result_hash[record[4]].nil?
      result_hash[record[4]] = 1
    else
      result_hash[record[4]] += 1
    end
  end
  CSV.open("data/data/counting/" + user_name + '.csv',"w") do |csvobject|
    result_hash = result_hash.to_a.transpose
    result_hash.each do |row_arr|
      csvobject << row_arr
    end
  end
end


