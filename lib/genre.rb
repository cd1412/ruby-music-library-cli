class Genre 

    attr_accessor :name, :song, :artist
    @@all = []

    extend Concerns::Findable
  
    def initialize(name)
      @name = name
      @@all << self
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

    def songs
      Song.all.select {|song| song.genre == self}
    end

    def artists
      songs.collect {|song| song.artist}.uniq
    end
end