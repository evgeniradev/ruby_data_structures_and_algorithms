class QuickSort
  def self.call(array, left_i = nil, right_i = nil)
    raise(ArgumentError, 'Argument must be an Array.') unless array.is_a?(Array)

    left_i ||= 0
    right_i = (right_i || array.length) - 1
    pivot = right_i

    while left_i < pivot
      if array[left_i] >= array[pivot]
        tmp = array[left_i]
        array[left_i] = array[pivot - 1]
        array[pivot - 1] = array[pivot]
        array[pivot] = tmp

        pivot -= 1
      else
        left_i += 1
      end
    end

    call(array, 0, pivot) if (pivot - 1).positive?
    call(array, pivot + 1, right_i + 1) if pivot + 1 < right_i

    array
  end
end
