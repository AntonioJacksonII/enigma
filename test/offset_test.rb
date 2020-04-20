require_relative 'test_helper'

class OffsetTest < Minitest::Test

  def setup
    @offset = Offset.new("040895")
    @offset2 = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
    assert_instance_of Offset, @offset2
  end

  def test_it_has_date
    assert_equal "040895", @offset.date
  end

  def test_random_date_attribute
    offset = Offset.new
    assert_instance_of String, offset.date
    assert_equal 6, offset.date.length
  end

  def test_square_date
    assert_equal 1672401025, @offset.square_date
    offset = Offset.new
    offset.stubs(:date).returns("000001")
    assert_equal 1, offset.square_date
  end

  def test_create_offsets
    result = {A: 1, B: 0, C: 2, D: 5}
    assert_equal result, @offset.create_offsets
    offset = Offset.new
    offset.stubs(:square_date).returns(1)
    result2 = {A: 0, B: 0, C: 0, D: 1}
    assert_equal result2, offset.create_offsets
  end
end
