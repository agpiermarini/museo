class Curator
  attr_reader :artists, :museums, :photographs
  def initialize
    @artists = []
    @museums = []
    @photographs = []
  end

  def add_museum(hash)
    museums << Museum.new({id: museums.count + 1}.merge(hash))
  end

  def add_artist(hash)
    artists << Artist.new({id: artists.count + 1}.merge(hash))
  end

  def add_photograph(hash)
    photographs << Photograph.new({id: photographs.count + 1}.merge(hash))
  end

  def find_museum(id)
    museums.find { |museum| museum.id == id }
  end

  def find_artist(id)
    artists.find { |artist| artist.id == id }
  end

  def find_museum_by_photograph(photograph)
    museums.find { |museum| museum.id == photograph.museum_id }
  end

  def find_artist_by_photograph(photograph)
    artists.find { |artist| artist.id == photograph.artist_id }
  end
end
