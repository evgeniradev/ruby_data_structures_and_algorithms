class QuickSort
  def self.call(array, left_i = nil, right_i = nil)
    raise(ArgumentError, 'Argument must be an Array.') unless array.is_a?(Array)

    left_i ||= 0
    right_i = (right_i || array.length) - 1
    pivot_i = right_i

    while left_i < pivot_i
      if array[left_i] >= array[pivot_i]
        tmp = array[left_i]
        array[left_i] = array[pivot_i - 1]
        array[pivot_i - 1] = array[pivot_i]
        array[pivot_i] = tmp

        pivot_i -= 1
      else
        left_i += 1
      end
    end

    call(array, 0, pivot_i) if (pivot_i - 1).positive?
    call(array, pivot_i + 1, right_i + 1) if pivot_i + 1 < right_i

    array
  end
end
