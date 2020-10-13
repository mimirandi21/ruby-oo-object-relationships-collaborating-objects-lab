class Artist
    attr_accessor :name, :songs
    
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def save
        @@all << self

    end

    def self.all
        @@all
    end

    def artist_all
        self.all
    end

    def add_song(songs)
        @songs << songs
    end

    def songs
        Song.all.each do |song|	
            if song.artist == self	
                @songs << song	
            end	
        end	
        @songs
    end

    def self.find_or_create_by_name(name)
        self.all.detect {|artist| artist.name == name} || self.new(name)
    end

    def print_songs
        songs.each {|song| puts song.name}
    end

end