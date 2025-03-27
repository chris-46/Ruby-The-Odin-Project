# This method outputs the result of shift each character in s by x positions, with z wrapping around a.
# ignore whitespaces and non-alphabet characters, so conditional on 'a'-'z' and 'A'-'Z'

class CaesarCipher

  def caesar_cipher(s, shift)
    result = ''
    s.each_char do |c|
      if c.ord.between?('A'.ord,'Z'.ord) || c.ord.between?('a'.ord,'z'.ord) # Shift only alphabets
        if c.ord >= 'A'.ord && c.ord <= 'Z'.ord
          result += ('A'.ord + (c.ord - 'A'.ord + shift) % 26).chr
        else
          result += ('a'.ord + (c.ord - 'a'.ord + shift) % 26).chr
        end
      else 
        result += c
      end
    end
    puts result
  end

end


### IRB Output:
# irb(main):013> cipher.caesar_cipher("Apple", 2)
# Crrng
# => nil
# irb(main):014> cipher = CaesarCipher.new
# irb(main):015> cipher.caesar_cipher("APPLWE", 2)
# CRRNYG
# => nil
# irb(main):016> cipher = CaesarCipher.new
# irb(main):017> cipher.caesar_cipher("CRRNG", -2)
# APPLE
# => nil
# irb(main):018> cipher = CaesarCipher.new
# irb(main):019> cipher.caesar_cipher("CHRISTOPHER", 200000)
# KPZQABWXPMZ
# => nil
# irb(main):020> cipher = CaesarCipher.new
# irb(main):021> cipher.caesar_cipher("KPZQABWXPMZ", -200000)
# CHRISTOPHER
# => nil