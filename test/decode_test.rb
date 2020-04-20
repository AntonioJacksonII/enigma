require_relative 'test_helper'

class DecodeTest < Minitest::Test

  def setup
    @decode = Decode.new("keder ohulw", "02715", "040895")
  end

  def test_is_exists
    assert_instance_of Decode, @decode
  end
end
