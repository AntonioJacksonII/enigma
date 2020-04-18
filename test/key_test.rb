require_relative 'test_helper'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new("02715")
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_it_has_attributes
    assert_equal "02715", @key.key
  end

  def test_random_key_attribute
    key = Key.new

    assert_instance_of String, key.key
    assert_equal 5, key.key.length
  end

  def test_create_keys
    result = {
              A: 2,
              B: 27,
              C: 71,
              D: 15
            }
    assert_equal result, @key.create_keys
  end

end
