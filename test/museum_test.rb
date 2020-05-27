require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/patron"
require_relative "../lib/exhibit"
require_relative "../lib/museum"
require 'pry'


class MuseumTest < Minitest::Test

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")

    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})

    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 20)
    @patron = Patron.new("Bob", 0)
    @patron_3 = Patron.new("Johnny", 5)

  end

  def test_it_exists
    assert_instance_of Museum, @dmns

  end

  def test_it_has_readable_attributes
    assert_equal "Denver Museum of Nature and Science", @dmns.name
    assert_equal [], @dmns.exhibits

  end

  def test_it_can_add_exhibits
    assert_equal [], @dmns.exhibits
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    assert_equal [@gems_and_minerals, @dead_sea_scrolls, @imax], @dmns.exhibits

  end

  def test_it_can_recommend_exhibits
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2.add_interest("IMAX")

    assert_equal [@gems_and_minerals, @dead_sea_scrolls], @dmns.recommend_exhibits(@patron_1)
    assert_equal [@imax], @dmns.recommend_exhibits(@patron_2)

  end

  def test_it_can_admit_patrons

    assert_equal [], @dmns.patrons

    @dmns.admit(@patron)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)

    assert_equal [@patron, @patron_2, @patron_3], @dmns.patrons

  end

  def test_it_can_match_exhibits_to_patrons

    @dmns.admit(@patron)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)

    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    @patron.add_interest("Gems and Minerals")
    @patron_2.add_interest("Dead Sea Scrolls")
    @patron_3.add_interest("Dead Sea Scrolls")

    expected = {
      @gems_and_minerals => [@patron],
      @dead_sea_scrolls => [@patron_2, @patron_3],
      @imax => []
    }

    assert_equal expected, @dmns.patrons_by_exhibit_interest

  end


end
