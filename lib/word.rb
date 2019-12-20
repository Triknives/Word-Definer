class Word
  attr_reader :name, :id, :year, :genre, :artist
  @@albums = {}
  @@total_rows = 0

  def initialize(name, id, year, genre, artist)
    @name = name
    @id = id || @@total_rows += 1
    @year = year
    @genre = genre
    @artist = artist
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.year, self.genre, self.artist)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def self.search(search_term)
     @@albums.values.select { |album| album.name =~ /#{search_term}/i }
  end

  def self.sort
    @@albums.values.sort { |a, b| a.name <=> b.name }
  end

  def update(name, year, genre, artist)
    @name = (name != '') ? name : @name
    @year = (year != '') ? year : @year
    @genre = (genre != '') ? genre : @genre
    @artist = (artist != '') ? artist : @artist
  end

  def delete
    @@albums.delete(self.id)
  end

  def songs
    Song.find_by_album(self.id)
  end
end
