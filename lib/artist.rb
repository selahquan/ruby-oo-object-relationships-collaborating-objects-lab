class Artist
    attr_accessor :name, :songs
    def initialize(name)
        @name= name
        @@all << self
        @songs = []
    end
    def save
        @@all << self
    end
    def add_song(song)
        song.artist = self
        @songs << song
        
    end
    def self.all
        @@all
        #Song.all.map {|song| song.artist.uniq}
    end
    def songs
        Song.all.select {|song| song.artist == self}
    end
    def self.find_or_create_by_name(name)
        self.all.detect {|artist| artist.name == name} || Artist.new(name)    
    end
    def self.create(name)
        Artist.new(name)
    end
    def print_songs
        @songs.each {|song| puts song.name}
    end
end