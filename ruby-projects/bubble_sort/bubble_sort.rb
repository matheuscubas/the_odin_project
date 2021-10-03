#Build a method #bubble_sort that takes an array and returns a sorted array. It must use 
#the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).


def bubble_sort(array)
  for i in 0...array.length
    sorted = true

    for k in 0...(array.length - i - 1)
      if array[k] > array [k + 1]
        array[k], array[k + 1] = array[k + 1], array[k]
        sorted = false
      end
    end
    break if sorted
  end
  return array
end

arr = [4,3,78,2,0,2]