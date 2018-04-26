require 'pry'

class Song

  attr_accessor :name, :artist, :genre

  @@count = 0
  @@artists = []
  @@genres = []
  @@songs = {}
  @@song_id = 0

  def initialize(name, artist, genre)
    #initialize instance variables for name, artist and genre
    @name = name
    @artist = artist
    @genre = genre

    #push the instance variables into the song storage method
    #that stores the song as a hash in the @@songs hash.
    song_storage(name, artist, genre)
    #increase the song count by one
    @@count += 1
    #push the artist into the gobal artist array
    @@artists << artist
    #psuh the genre into the global genre array
    @@genres << genre
  end

  def song_storage(name, artist, genre)
    #creates hash of all song information
    song_hash = {
      :name => name,
      :artist => artist,
      :genre => genre
    }
    #check if the song has exists in the song array
    #if the hash doesn't exist, increase the song_id and
    #add the information to the song hash
    if @@songs.values.include?(song_hash) == false
      @@song_id += 1
      @@songs[@@song_id] = song_hash
    end

  end

  #counts the number of unique instances of a key in the song hash
  def self.song_count(query)
    count = {}
    songs = @@songs
    songs.each do |song_id, song_hash|
      key = song_hash[query.to_sym]
      if !count[key]
        count[key] = 1
      else
        count[key] += 1
      end
    end
    count
  end

  def self.count
    @@count
  end

  def self.artists
    @@artists.uniq
  end

  def self.genres
    @@genres.uniq
  end

  def self.genre_count
    song_count("genre")
  end

  def self.artist_count
    song_count("artist")
  end

end
