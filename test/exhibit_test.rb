require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/exhibit"

class ExhibitTest < Minitest::Test

  def setup
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  end

  def test_it_exists
    assert_instance_of Exhibit, @exhibit

  end
end
