require_relative 'test_helper'

class EncodeTest < Minitest::Test

  def test_it_exists
    encrypt = Encode.new("hello world", "02715", "040895")
    assert_instance_of Encode, encrypt
  end
end
