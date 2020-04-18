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
end
