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

# Example runs:
# irb(main):003> bs=BubbleSort.new
# => #<BubbleSort:0x00000165a515dfe0>
# irb(main):004> bs.bubble_sort([4,3,78,2,0,2])
# => [0, 2, 2, 3, 4, 78]
# irb(main):005> bs.bubble_sort([4,3,78,2,0,2])
# => [0, 2, 2, 3, 4, 78]
# irb(main):006> bs.bubble_sort([5,23,7,34,21,4])
# => [4, 5, 7, 21, 23, 34]
# irb(main):007> bs.bubble_sort([4,3,78,21,234,30,2,2342])
# => [2, 3, 4, 21, 30, 78, 234, 2342]
# irb(main):008> exit