class SubStrings

  # Given a text, this methodcounts how many times one (if any) of its substrings (case insensitive) were found in the dictionary.
  # Returns a hash with the substrings & counts.
  def substrings(text, dict)
    result = Hash.new(0)
    lowcase_text = text.downcase

    # put the cart before the horse: there are a LOT of substrings possible in text, so let's look to find subtrings from words in dict!
    dict.each do |w|
      matches = lowcase_text.scan(w).length # Take the length of the array of words matching the regex patterns in the variable w
      # puts(lowcase_text.scan(w))
      result[w] = matches unless matches == 0 # We take non-zero matches and keep the result!
    end
    result
  end
  
end

# Quick Example:
# irb(main):025> ss.substrings("below", dictionary)
# => {"below"=>1, "low"=>1}

# Verbose Output:
# irb(main):019> ss = SubStrings.new
# => #<SubStrings:0x000001d349bb51e8>
# irb(main):020> ss.substrings("Howdy partner, sit down! How's it going?",["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"])     
# #################
# down
# #################
# go
# #################
# going
# #################
# #################
# how
# how
# #################
# howdy
# #################
# it
# it
# #################
# i
# i
# i
# #################
# #################
# own
# #################
# part
# #################
# partner
# #################
# sit
# #################
# => {"down"=>1, "go"=>1, "going"=>1, "how"=>2, "howdy"=>1, "it"=>2, "i"=>3, "own"=>1, "part"=>1, "partner"=>1, "sit"=>1}