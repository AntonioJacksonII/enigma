require_relative 'enigma'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

incoming_message = handle.read
handle.close

encrypted_message = enigma.encrypt(incoming_message)

writer = File.open(ARGV[1], "w")

writer.write(encrypted_message)
writer.close

p "Created #{ARGV1} with the key #{enigma.key} and date #{enigma.date}"