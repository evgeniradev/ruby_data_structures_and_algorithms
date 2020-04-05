class InsertionSort
  def self.call(array)
    raise(ArgumentError, 'Argument must be an Array.') unless array.is_a?(Array)

    i = 1

    while i < array.length
      j = 0
      z = i

      i += 1

      if array[z] <= array[j]
        array.unshift(array.delete_at(z))
        next
      else
        j += 1
      end

      next if array[z] >= array[z - 1]

      tmp = nil

      while j < z
        if array[z] > array[j]
          j += 1
        else
          tmp = array[z]
          array[z] = array[z - 1]
          array[z - 1] = tmp

          z -= 1
        end
      end
    end

    array
  end
end
