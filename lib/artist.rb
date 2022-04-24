class Artist 

    attr_accessor :name
    @@all = []

    extend Concerns::Findable
  
    def initialize(name)
      @name = name
      @@all << self
      @songs = []
    end

    def self.all
        @@all
    end
  
    def save
        self.class.all << self
    end  

    def self.create(name)
        new(name).tap{|a| a.save}
    end
  
    def self.destroy_all
        self.all.clear
    end

    def add_song(song)
        if song.artist == nil
          song.artist = self
        else
          nil
        end
        if @songs.include?(song)
          nil
        else
          @songs << song
        end
        song
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def genres
        songs.map {|song| song.genre}.uniq
    end

end