require "pry"
# This method uses a heap to sort an array.
# Time Complexity:  O (n log n) where n is the number of elements in the heap
# Space Complexity: O (1)

# Adapted from diagrams and pseudocode in https://medium.com/basecs/heapify-all-the-things-with-heap-sort-55ee1c93af82

def heapsort(list)
  limit = list.length
  build_max_heap(list)
  
  while limit > 0 # O(n)
    swap(list, 0, limit - 1)
    limit -= 1
    heapify(list, 0, limit) # O(log n)
  end
  
  return list
end

def build_max_heap(list)
  index = list.length/2 - 1
  while index >= 0
    heapify(list, index, list.length) 
    index -= 1
  end
end


def heapify(list, index, limit)
  root = index

  while index < limit
    left = (2 * index) + 1
    right = (2 * index) + 2

    if left >= limit && right >= limit
      return
    elsif right >= limit
      max = left
    else
      max = [left, right].max_by {|x| list[x]}
    end
    
    if list[max] > list[root]
      root = max
    else
      return
    end

    swap(list, root, index)
    
    index = root
  end
end

def swap(list, index_1, index_2)
  temp = list[index_1]
  list[index_1] = list[index_2]
  list[index_2] = temp
end