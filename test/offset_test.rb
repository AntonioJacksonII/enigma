require_relative 'test_helper'

class OffsetClass < Minitest::Test

  def test_it_exists
    offset = Offset.new("040895")
    assert_instance_of Offset, offset
  end
end
