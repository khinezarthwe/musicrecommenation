require 'csv'
require 'rubygems'
require 'bundler/setup'
require 'lda-ruby'
songlist = []
stop_word_list = ['big']
Dir.foreach('data/data/testing/') do |filename|
  next if filename == '.' or filename == '..'
  songlist << filename.chomp('.txt')
end
corpus = Lda::Corpus.new
Dir.foreach('data/data/testing/') do |song_name|
  next if song_name == '.' or song_name == '..'
  file = File.open('data/data/testing/'+ song_name, "r")

  songlyric = file.read
  songlyric = songlyric.delete(stop_word_list.to_s)
  songdata = Lda::TextDocument.new(corpus,songlyric)
  #p songdata
  corpus.add_document(songdata)
end


lda = Lda::Lda.new(corpus)
lda.num_topics = 8
lda.em('random')
topics = lda.top_words(10)
#lda.print_topics(10)

mat1 = lda.compute_topic_document_probability
#mat1.to_a.each {|r| puts r.inspect}
CSV.open("data/data/testing/result" ,"w") do |csvobject|
  mat1.to_a.each do |r|
    csvobject << r
  end
end



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
