require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/patron"
require_relative "../lib/exhibit"
require_relative "../lib/museum"

class MuseumTest < Minitest::Test

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")

    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})

    @patron_1 = Patron.new("Bob", 20)
    @patron_2.add_interest("IMAX", 15)

  end

  def test_it_exists
    assert_instance_of Museum, @dmns 

  end
end
