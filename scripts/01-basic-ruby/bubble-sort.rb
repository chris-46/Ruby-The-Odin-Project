class BubbleSort
  
  def bubble_sort(array)
    return array if array.length < 2  # Already sorted if length < 2
    
    n = array.length
    (n - 1).times do |i| # Will only have to do this a max of n-1 times.
      j = 0
      while j < array.length - 1 do
        nxt = j + 1
        
        # Sanity printing bubble progressions :)
        # puts("curr: #{array[j]}")
        # puts("nxt: #{array[nxt]}")
        
        if array[j] > array[nxt]
          array[j], array[nxt] = array[nxt], array[j]
        end

        j = nxt
      end
    end
    return array
  end

end