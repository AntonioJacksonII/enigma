require_relative 'test_helper'

class DecodeTest < Minitest::Test

  def setup
    @decode = Decode.new("keder ohulw", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Decode, @decode
  end

  def test_it_has_attributes
    assert_equal "keder ohulw", @decode.message
    assert_equal "02715", @decode.key
    assert_equal "040895", @decode.date
  end
end
