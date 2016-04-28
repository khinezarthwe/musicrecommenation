#<<<<<<<<<<<<<<<textpreparinglyric.rb ---------------------------------songwithgruop_10topic.rb>>>>>>>>
#this file for calculating song relationship between each songs and each songs using LDA
# for these file I can get the log probabiliy of each topic upon song
# Form this file result , I got goups of each song latent structure for each topic.
require 'csv'
require 'rubygems'
require 'bundler/setup'
require 'lda-ruby'
module Music
  module SongRelationshipUsinglda

    def self.input
      stop_word_list = []
      corpus = Lda::Corpus.new
      Dir.foreach('data/data/lyricdata/') do |song_name|
        next if song_name == '.' or song_name == '..'
        file = File.open('data/data/lyricdata/'+ song_name, "r")
        songlyric = file.read
        songlyric = songlyric.split(/\W+/)
        songlyric = songlyric-stop_word_list
        songdata = Lda::TextDocument.new(corpus,songlyric.to_s)
        corpus.add_document(songdata)
      end
      corpus
    end
    def self.output result_matrix
      songlist = []
      Dir.foreach('data/data/lyricdata/') do |filename|
        next if filename == '.' or filename == '..'
        songlist << filename.chomp('.txt')
      end
      CSV.open("data/LDA_topic_result/ldaresultforsong.csv" ,"w") do |csvobject|
        csvobject << songlist
        result_matrix.transpose.to_a.each do |r|
          csvobject << r
        end
      end
    end
    def self.process corpus
      lda = Lda::Lda.new(corpus)
      lda.num_topics = 30
      lda.em('random')
      topics = lda.top_words(10)
      mat1 = lda.compute_topic_document_probability

    end
    def self.main
      corpus = input
      result_matrix = process corpus
      output result_matrix
    end
  end
end
Music::SongRelationshipUsinglda.main
