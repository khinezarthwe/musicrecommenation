

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
=end