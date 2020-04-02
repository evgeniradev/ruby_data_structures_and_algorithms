class MergeSort
  def self.call(arr)
    raise(ArgumentError, 'Argument must be an Array.') unless arr.is_a?(Array)

    return arr if arr.length <= 1

    mid_point = arr.length / 2

    left_arr = call(arr[0...mid_point])
    right_arr = call(arr[mid_point..-1])

    left_arr_index = 0
    right_arr_index = 0

    new_arr = []

    while left_arr_index < left_arr.length && right_arr_index < right_arr.length
      if left_arr[left_arr_index] <= right_arr[right_arr_index]
        new_arr << left_arr[left_arr_index]
        left_arr_index += 1
      elsif left_arr[left_arr_index] >= right_arr[right_arr_index]
        new_arr << right_arr[right_arr_index]
        right_arr_index += 1
      end
    end

    if left_arr_index < left_arr.length
      new_arr.concat(left_arr[left_arr_index..-1])
    elsif right_arr_index < right_arr.length
      new_arr.concat(right_arr[right_arr_index..-1])
    end

    new_arr
  end
end
