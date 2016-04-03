#<<<<<<<<<<<<<<<textpreparinglyric.rb ----------------------------------
#this file for calculating song relationship between each songs and each songs using LDA
# for these file I can get the log probabiliy of each topic upon song
# Form this file result , I got goups of each song latent structure for each topic.
module Music
  module SongRelationshipUsinglda
    def self.input

    end
    def self.output

    end
    def self.main
      Dir.foreach('data/data/lyricdata/') do |filename|
        next if filename == '.' or filename == '..'
        file =  File.read('data/data/lyricdata/' + filename)
        result_arr = process file
        output(result_arr,filename)
      end

    end
  end
end
