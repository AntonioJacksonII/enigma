class Encode
  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message.downcase
    @key = key
    @date = date
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def keys
    Key.new(key).create_keys
  end

  def offsets
    Offset.new(date).create_offsets
  end

  def shifts
    {
      A: keys[:A] + offsets[:A],
      B: keys[:B] + offsets[:B],
      C: keys[:C] + offsets[:C],
      D: keys[:D] + offsets[:D]
    }
  end
end
