require_relative 'test_helper'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new("040895")
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_has_date
    assert_equal "040895", @offset.date
  end
end
