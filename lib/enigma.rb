class Enigma

  def encrypt(message, key, date)
    new_message = Message.new(message, key, date)
    new_message.encrypt
  end
end
