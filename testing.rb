file =  File.read('data/data/lyricdata/00042d36-1f4b-41ac-bf9d-a18c741507ca.txt')
#text = "timeI've wasted such a long timeBeen"
text_arr = file.split

word_list = []
text_arr.each do |word|
  test_ans = word.split /(?=[A-Z])/
	word_list += test_ans 
end

#p word_list

#p word_list.join(" ")

File.open('data/data/testing/'+'a.txt', 'w') {|f| f.write(word_list.join(" "))}








=begin
require 'lda-ruby'
corpus = Lda::Corpus.new
document1 = Lda::TextDocument.new(corpus, '')


document2 = Lda::TextDocument.new(corpus, '')

corpus.add_document(document1)
corpus.add_document(document2)
corpus.remove_word("cobb")
lda = Lda::Lda.new(corpus)

lda.verbose = false
lda.num_topics = 5
lda.em('random')
topics = @lda.top_words(5)
puts topics
#mat1 = @lda.compute_topic_document_probability
#mat1.to_a.each {|r| puts r.inspect}



================ words by text ===========================
def words_from_string(string)
	string.downcase.scan(/[\w']+/)
end

p words_from_string(" love you ! sorry I don't Love you ")

def count_frequency(word_list)
  counts = Hash.new(0)
  for words in word_list
    counts[words] +=1
  end
  counts
end

count_frequency = count_frequency(words_from_string(" love you ! sorry I don't Love you "))
p count_frequency





Dir.foreach('data/data/lyricdata/') do |filename|
  next if filename == '.' or filename == '..'
  file =  File.read('data/data/lyricdata/' + filename)
  if file.length < 500
    File.delete('data/lyricdata/' + filename)
  end
end

=end
