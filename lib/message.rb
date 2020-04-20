require_relative 'key'
require_relative 'offset'

class Message
  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def characters
    ("a".."z").to_a << " "
  end

  def keys
    Key.new(@key).create_keys
  end

  def offsets
    Offset.new(@date).create_offsets
  end

  def initial_shifts
    {
      A: keys[:A] + offsets[:A],
      B: keys[:B] + offsets[:B],
      C: keys[:C] + offsets[:C],
      D: keys[:D] + offsets[:D]
    }
  end

  def shifts
    final_shifts = {}
    initial_shifts.each do |letter, shift|
      until shift < 27
        shift -= 27
      end
      final_shifts[letter] = shift
    end
    final_shifts
  end

  def split_message
    @message.downcase.split(//)
  end

  def encrypt_message
    encryption = []
    counter = 0
    split_message.each do |character|
      if characters.include?(character) == false
        encryption << character
      elsif counter == 0 || counter % 4 == 0
        encryption << characters[characters.index(character) - (27 - shifts[:A])]
      elsif counter == 1 || counter % 4 == 1
        encryption << characters[characters.index(character) - (27 - shifts[:B])]
      elsif counter == 2 || counter % 4 == 2
        encryption << characters[characters.index(character) - (27 - shifts[:C])]
      elsif counter == 3 || counter % 4 == 3
        encryption << characters[characters.index(character) - (27 - shifts[:D])]
      end
      counter += 1
    end
    encryption.join
  end

  def decrypt_message
    decryption = []
    counter = 0
    split_message.each do |character|
      if characters.include?(character) == false
        decryption << character
      elsif counter == 0 || counter % 4 == 0
        decryption << characters[characters.index(character) - shifts[:A]]
      elsif counter == 1 || counter % 4 == 1
        decryption << characters[characters.index(character) - shifts[:B]]
      elsif counter == 2 || counter % 4 == 2
        decryption << characters[characters.index(character) - shifts[:C]]
      elsif counter == 3 || counter % 4 == 3
        decryption << characters[characters.index(character) - shifts[:D]]
      end
      counter += 1
    end
    decryption.join
  end

  def encrypt
    {
      encryption: encrypt_message, key: @key, date: @date
    }
  end

  def decrypt
    {
      decryption: decrypt_message, key: @key, date: @date
    }
  end
end
