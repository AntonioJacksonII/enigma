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

  def test_create_keys
    result = { A: 2, B: 27, C: 71, D: 15}
    assert_equal result, @key.create_keys
    key = Key.new
    key.stubs(:key).returns("00001")
    result2 = { A: 0, B: 0, C: 0, D: 1}
    assert_equal result2, key.create_keys
  end

end
