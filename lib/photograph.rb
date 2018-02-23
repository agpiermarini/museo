class Photograph
  attr_reader :id, :name, :artist_id, :museum_id, :year
  def initialize(hash)
    @id =  hash[:id]
    @name = hash[:name]
    @artist_id = hash[:artist_id]
    @museum_id = hash[:museum_id]
    @year = hash[:year]
  end
end
