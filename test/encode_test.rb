require_relative 'test_helper'

class EncodeTest < Minitest::Test

  def setup
    @encode = Encode.new("HELLO WORLD", "02715", "040895")
  end

  def test_it_exists
    assert_instance_of Encode, @encode
  end

  def test_it_has_attributes
    assert_equal "hello world", @encode.message
    assert_equal "02715", @encode.key
    assert_equal "040895", @encode.date
  end
end
