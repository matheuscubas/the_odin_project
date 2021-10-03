#Build a method #bubble_sort that takes an array and returns a sorted array. It must use 
#the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).


def bubble_sort(array)
  n = array.length
  loop do 
    sorted = false
    (n-1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        sorted = true
      end
    end
    break if not sorted
  end
  return array
end


arr = [4,3,78,2,0,2]
bubble_sort(arr)

#=> [0, 2, 2, 3, 4, 78]
