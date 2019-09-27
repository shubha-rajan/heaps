require "pry"
# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  
  index = 0
  while index < list.length
    heapify(list.drop(index), 0)
    
    swap(list, index, list.length - 1)
    binding.pry
    index += 1
  end
  return list
end

def heapify(list, index)
  binding.pry
  left = (2 * index) + 1
  right = (2 * index) + 2

  if !list[left] && !list[right]
    return 
  elsif !list[right]
    min = left
  else
    min = [left, right].min_by {|x| list[x]}
  end

  if list[index] > list[min]
    swap(list, index, min)
    heapify(list, min)
  end
end

def swap(list, index_1, index_2)
  temp = list[index_1]
  list[index_1] = list[index_2]
  list[index_2] = temp
end