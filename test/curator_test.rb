require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'

class CuratorTest < Minitest::Test
  def test_it_exists
    curator = Curator.new
    assert_instance_of Curator, curator
  end

  def test_it_intitializes_with_empty_artist_museum_and_photographs_arrays
    curator = Curator.new
    assert_equal [], curator.artists
    assert_equal [], curator.museums
    assert_equal [], curator.photographs
  end

  def test_can_add_museum_as_hash
    curator = Curator.new
    curator.add_museum({name: "MoMA"})
    assert_instance_of Museum, curator.museums.first
  end

  def test_museum_count
    curator = Curator.new
    curator.add_museum({name: "MoMA"})
    assert_equal 1, curator.museums.count
  end

  def test_museum_id
    curator = Curator.new
    curator.add_museum({id: 1, name: "MoMA"})
    assert_equal 1, curator.museums.first.id
  end

  def test_can_add_arist
    curator = Curator.new
    curator.add_artist({id: 1, name: "Ansel Adams", born: 1902, died: 1984, country: "United States"})
    assert_instance_of Artist, curator.artists.first
  end

  def test_artist_count_and_id
    curator = Curator.new
    curator.add_artist({id: 1, name: "Ansel Adams", born: 1902, died: 1984, country: "United States"})
    assert_equal 1, curator.artists.count
    assert_equal 1, curator.artists.first.id
  end

  def test_it_can_add_photographs
    curator = Curator.new
    curator.add_photograph({name: "Moonrise, Hernandez", artist_id: 1, museum_id: 1, year: 1941})
    assert_instance_of Photograph, curator.photographs.first
  end

  def test_photograph_count_and_id
    curator = Curator.new
    curator.add_photograph({id: 1, name: "Moonrise, Hernandez", artist_id: 1, museum_id: 1, year: 1941})
    assert_equal 1, curator.photographs.count
    assert_equal 1, curator.photographs.first.id
  end

  def test_it_can_find_museum_by_id
    curator = Curator.new
    curator.add_museum({id: 1, name: "Museo de Arte Moderno"})
    assert_equal "Museo de Arte Moderno", curator.find_museum(1).name
    assert_equal 1, curator.find_museum(1).id
  end

  def test_it_can_find_artist_by_id
    curator = Curator.new
    curator.add_artist({id: 1, name: "Ansel Adams", born: 1902, died: 1984, country: "United States"})
    assert_equal "Ansel Adams", curator.find_artist(1).name
    assert_equal 1, curator.find_artist(1).id
  end

  def test_it_can_find_museum_by_photograph
    curator = Curator.new
    curator.add_museum({id: 1, name: "Metropolitan Museum of Art"})
    curator.add_artist({id: 1, name: "Diane Arbus", born: 1923, died: 1971, country: "United States"})
    curator.add_photograph({id: 1, name: "Identical Twins, Roselle, New Jersey", artist_id: 1, museum_id: 1, year: 1967})

    photograph = curator.photographs.first
    museum = curator.find_museum_by_photograph(photograph)

    assert_instance_of Museum, museum
    assert_equal "Metropolitan Museum of Art", museum.name
    assert_equal 1, museum.id
  end

  def test_it_can_find_artist_by_photograph
    curator = Curator.new
    curator.add_museum({id: 1, name: "Metropolitan Museum of Art"})
    curator.add_artist({id: 1, name: "Diane Arbus", born: 1923, died: 1971, country: "United States"})
    curator.add_photograph({id: 1, name: "Identical Twins, Roselle, New Jersey", artist_id: 1, museum_id: 1, year: 1967})

    photograph = curator.photographs.first
    artist = curator.find_artist_by_photograph(photograph)

    assert_instance_of Artist, artist
    assert_equal "Diane Arbus", artist.name
    assert_equal 1, artist.id
  end
end
