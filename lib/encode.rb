class Encode
  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message.downcase
    @key = key
    @date = date
  end
end
