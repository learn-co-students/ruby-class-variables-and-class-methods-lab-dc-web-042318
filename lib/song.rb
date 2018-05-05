class Song
 attr_accessor :name, :artist, :genre
 # needs .count   .atrist   .genres
 # .number of songs for each genre
 # .number of songs for each artist

 @@count = 0
 @@genres = []
 @@artists = []


 def initialize(name, artist, genre)
   @name = name
   @artist = artist
   @genre = genre
   @@count += 1
   @@genres << self.genre
   @@artists <<self.artist

 end

 def self.count
   @@count
 end

 def self.genres
   @@genres.uniq
 end

 def self.artists
   @@artists.uniq
 end

#  def self.genre_count
#   @@genres.each { |genre| @@genre_count[genre] += 1 }
#   @@genre_count
# end
#
# def self.artist_count
#   @@artists.each { |artist| @@artist_count[artist] += 1 }
#   @@artist_count
# end
    def self.genre_count
        @@genres.each_with_object(Hash.new(0)) { |genre, result| result[genre] += 1 }
    end

    def self.artist_count
        @@artists.each_with_object(Hash.new(0)) { |artist, result| result[artist] += 1 }
    end


end
