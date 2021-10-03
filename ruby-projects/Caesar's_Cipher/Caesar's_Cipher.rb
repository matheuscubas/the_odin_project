def caesars_cipher(string, number)
  shift_factor = number.abs
  message = string.bytes
  shifted = []

  shifted = message.map do |ascii|
    if ascii.between?(65,90)
      ascii + shift_factor > 90 ? (ascii + shift_factor) - 26 : ascii + shift_factor
    else ascii.between?(97,122)
      ascii + shift_factor > 122 ? (ascii + shift_factor) - 26 : ascii + shift_factor
    end
  end
  encrypted_message = shifted.pack('c*')
  return encrypted_message
end

print "Please insert a message you would like to encrypt : "
string = gets.chomp.to_str

print "Enter a security number, the security number must be a number between 1 to 26: "
number = gets.chomp.to_i

caesars_cipher(string,number)
  