class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O (log n) where n is the number of nodes in the store
  # Space Complexity: O(1)
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    @store << new_node
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O (log n) where n is the number of nodes in the store
  # Space Complexity: O(1) 
  def remove()
    swap(0, @store.length - 1)
    removed_node = @store.pop
    heap_down(0)
    return removed_node.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(log n) where n is the number of nodes in the store
  # Space complexity: O(1)
  def heap_up(index)
    return if index == 0
    parent_index = (index - 1) / 2
    if @store[index].key < @store[parent_index].key
      swap(index, parent_index)
      heap_up(parent_index)
    else
      return
    end
  end

  # This helper method takes an index and 
  #  moves it down the heap 
  # Time complexity: O (log n) where n is the number of nodes in the store
  # Space complexity: O(1)
  def heap_down(index)
    left = (2 * index) + 1
    right = (2 * index) + 2
    if !@store[left] && !@store[right]
      return 
    elsif !@store[right]
      min = left
    else
      min = [left, right].min_by {|x| @store[x].key}
    end
    swap(index, min)
    heap_down(min)
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end