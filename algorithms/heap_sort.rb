require_relative '../data_structures/max_heap'

class HeapSort
  def self.call(array)
    raise(ArgumentError, 'Argument must be an Array.') unless array.is_a?(Array)

    MaxHeap.new(array).sort
  end
end
