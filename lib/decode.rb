class Decode
  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def character_set
    ("a".."z").to_a << " "
  end
end
