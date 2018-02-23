require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'

class PhotographTest < Minitest::Test

  def test_it_exists
    photo = Photograph.new({})
    assert_instance_of Photograph, photo
  end

  def test_it_itinitializes_with_hash
    photo = Photograph.new({id: 1, name: "Rue Mouffetard, Paris (Boy with Bottles)", artist_id: 4, museum_id: 2, year: 1954})
    assert_instance_of Photograph, photo
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", photo.name
    assert_equal 1, photo.id
    assert_equal 4, photo.artist_id
    assert_equal 2, photo.museum_id
    assert_equal 1954, photo.year
  end
end
