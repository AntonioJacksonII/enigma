require_relative 'test_helper'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_default_date
    encrypted = @enigma.encrypt("hello world", "02715")
    encrypted.stubs(:today).returns(Date.new(2020, 04,20))
    assert_equal "042020", encrypted[:date]
    decrypted = @enigma.decrypt(encrypted[:encryption], "02715")
    assert_equal "042020", decrypted[:date]
  end

  def test_default_key
    encrypted = @enigma.encrypt("hello world")
    assert_instance_of String, encrypted[:key]
    assert_equal 5, encrypted[:key].length
  end

  def test_encrypt
    result = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal result, @enigma.encrypt("hello world", "02715", "040895")
    encrypted = @enigma.encrypt("hello world", "02715")
    encrypted.stubs(:today).returns(Date.new(2020, 04, 20))
    result2 = {encryption: "jib qdmctpu", key: "02715", date: "042020"}
    assert_equal result2, encrypted
  end

  def test_decrypt
    result = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal result, @enigma.decrypt("keder ohulw", "02715", "040895")
    encrypted = @enigma.encrypt("hello world", "02715")
    decrypted = @enigma.decrypt(encrypted[:encryption], "02715")
    result2 = {decryption: "hello world", key: "02715", date: "042020"}
    assert_equal result2, decrypted
  end
end
