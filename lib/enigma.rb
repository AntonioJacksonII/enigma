require_relative 'message'
require 'date'

class Enigma

  def encrypt(message, key=rand(100000).to_s.rjust(5,'0'), date=Date.today.strftime("%m%d%y"))
    new_message = Message.new(message, key, date)
    new_message.encrypt
  end

  def decrypt(message, key=rand(100000).to_s.rjust(5,'0'), date=Date.today.strftime("%m%d%y"))
    new_message = Message.new(message, key, date)
    new_message.decrypt
  end
end
