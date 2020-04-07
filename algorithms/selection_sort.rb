class SelectionSort
  def self.call(array)
    raise(ArgumentError, 'Argument must be an Array.') unless array.is_a?(Array)

    current_smallest_element_i = 0
    initial_smallest_element_i = current_smallest_element_i
    i = initial_smallest_element_i + 1

    array.length.times do
      while i < array.length
        current_smallest_element_i = i if array[i] <= array[current_smallest_element_i]
        i += 1
      end

      next if current_smallest_element_i == initial_smallest_element_i

      tmp = array[initial_smallest_element_i]
      array[initial_smallest_element_i] = array[current_smallest_element_i]
      array[current_smallest_element_i] = tmp

      current_smallest_element_i = initial_smallest_element_i + 1
      initial_smallest_element_i = current_smallest_element_i
      i = initial_smallest_element_i + 1
    end

    array
  end
end
