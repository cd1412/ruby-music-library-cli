class Song 

    attr_accessor :name, :artist, :genre
    @@all = []
  
    def initialize(name, artist=nil,genre=nil)
        @name=name
        self.artist=(artist) if artist != nil
        self.genre=(genre) if genre != nil
    end
  
    def self.all
      @@all
    end

    def save
        self.class.all << self
    end

    def self.create(name, artist = nil, genre = nil)
        new(name, artist, genre).tap{|s| s.save}
    end

    def self.destroy_all
        self.all.clear
    end

    def self.find_by_name(name)
        self.all.find {|song|
          song.name == name
        }
      end
    
      def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
      end

      def self.new_from_filename(song)
        song_parts = song.split(" - ")
        song_name = song_parts[1]
        artist = Artist.find_or_create_by_name(song_parts[0])
        genre = Genre.find_or_create_by_name(song_parts[2].split('.')[0])
        self.create(song_name, artist, genre)  
      end
    
      def self.create_from_filename(name)
        song = self.new_from_filename(name)
        song.save
        song
      end
      
      def artist=(artist)
        @artist = artist
        artist.add_song(self)
      end

end  