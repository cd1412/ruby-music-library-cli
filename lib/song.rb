class Song 

    attr_accessor :name, :artist, :genre
    @@all = []
  
    def initialize(name, artist, genre)
      @name = name
      @artist = artist
      @genre = genre
      @@all << self
    end
  
    def self.all
      @@all
    end

    def self.create
        song = self.new
        song.save
        song
    end

    def self.destroy_all
        self.all.clear
    end

end  