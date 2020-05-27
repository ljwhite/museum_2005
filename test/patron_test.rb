require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/patron"

class PatronTest < Minitest::Test

  def setup
    @patron_1 = Patron.new("Bob", 20)

  end

  def test_it_exists
    assert_instance_of Patron, @patron_1

  end

  def test_it_has_readable_attributes
    assert_equal "Bob", @patron_1.name
    assert_equal 20, @patron_1.spending_money
    assert_equal [], @patron_1.interests

  end

  def test_patron_can_add_interests
    assert_equal [], @patron_1.interests
    @patron_1.add_interests("Dead Sea Scrolls")
    @patron_1.add_interests("Gems and Minerals")
    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], @patron_1.interests

  end
end
