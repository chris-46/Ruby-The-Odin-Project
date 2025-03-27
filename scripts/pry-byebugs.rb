require 'pry-byebug'

def isogram?(string)
  original_length = string.length
  string_array = string.downcase.split

  binding.pry

  unique_length = string_array.uniq.length # use next to step to this line and see the value.
  original_length == unique_length
end


isogram?("Odin")