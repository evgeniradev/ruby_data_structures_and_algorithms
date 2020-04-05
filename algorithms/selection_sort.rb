class SelectionSort
  def self.call(array)
    raise(ArgumentError, 'Argument must be an Array.') unless array.is_a?(Array)

    smallest_element_i = 0
    initial_smallest_element_i = smallest_element_i
    i = initial_smallest_element_i + 1

    array.length.times do
      while i < array.length
        smallest_element_i = i if array[i] <= array[smallest_element_i]
        i += 1
      end

      tmp = array[initial_smallest_element_i]
      array[initial_smallest_element_i] = array[smallest_element_i]
      array[smallest_element_i] = tmp

      smallest_element_i = initial_smallest_element_i + 1
      initial_smallest_element_i = smallest_element_i
      i = initial_smallest_element_i + 1
    end

    array
  end
end
