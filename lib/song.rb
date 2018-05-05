class Song
 attr_accessor :name, :artist, :genre

 # needs .count   .atrist   .genres
 # .number of songs for each genre
 # .number of songs for each artist

 @@count = 0
 @@genres = []
 @@artists = []
 @@genre_count = Hash.new(0)
 @@artist_count = Hash.new(0)

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

 def self.genre_count
   @@genres.each {|genre| @@genre_count[genre] += 1}
   return @@genre_count
 end

 def self.artist_count
   @@artists.each {|artist| @@artist_count[artist] += 1}
   return @@artist_count
 end


end
