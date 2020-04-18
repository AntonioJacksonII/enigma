require_relative 'test_helper'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new(key)
    assert_instance_of Key, key
  end

end
