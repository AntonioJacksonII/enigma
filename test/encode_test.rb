require_relative 'test_helper'

class EncryptTest < Minitest::Test

  def test_it_exists
    encrypt = Encrypt.new(message, key, date)
    assert_instance_of Encrypt, encrypt
  end
end
