class MergeSort
  def self.call(array)
    raise(ArgumentError, 'Argument must be an Array.') unless array.is_a?(Array)

    return array if array.length <= 1

    mid_point = array.length / 2

    left_array = call(array[0...mid_point])
    right_array = call(array[mid_point..-1])

    left_array_index = 0
    right_array_index = 0

    new_array = []

    while left_array_index < left_array.length && right_array_index < right_array.length
      if left_array[left_array_index] <= right_array[right_array_index]
        new_array << left_array[left_array_index]
        left_array_index += 1
      elsif left_array[left_array_index] >= right_array[right_array_index]
        new_array << right_array[right_array_index]
        right_array_index += 1
      end
    end

    if left_array_index < left_array.length
      new_array.concat(left_array[left_array_index..-1])
    elsif right_array_index < right_array.length
      new_array.concat(right_array[right_array_index..-1])
    end

    new_array
  end
end
