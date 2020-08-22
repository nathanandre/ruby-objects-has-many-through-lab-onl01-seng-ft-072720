class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_song(name)
        song = Song.new(name)
        song.artist = self
    end

    def songs
        Song.all.find_all{ |song| song.artist == self }
    end

    def genres
        self.songs.map{ |song| song.genre }.uniq
    end

    def new_song(name, genre)
        song = Song.new(name, self, genre)
    end
end
  