class Curator
  attr_reader :artists, :museums, :photographs
  def initialize
    @artists = []
    @museums = []
    @photographs = []
  end

  def add_museum(hash)
    museums << Museum.new(hash)
  end

  def add_artist(hash)
    artists << Artist.new(hash)
  end

  def add_photograph(hash)
    photographs << Photograph.new(hash)
  end

  def find_museum(id)
    museums.find do |museum|
      museum.id == id
    end
  end

  def find_artist(id)
    artists.find do |artist|
      artist.id == id
    end
  end

  def find_museum_by_photograph(photograph)
    museums.find do |museum|
      museum.id == photograph.museum_id
    end
  end

  def find_artist_by_photograph(photograph)
    artists.find do |artist|
      artist.id == photograph.artist_id
    end
  end
end
