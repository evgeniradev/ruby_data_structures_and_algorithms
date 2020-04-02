class InsertionSort
  def self.call(arr)
    raise(ArgumentError, 'Argument must be an Array.') unless arr.is_a?(Array)

    i = 1

    while i < arr.length
      j = 0
      z = i

      i += 1

      if arr[z] <= arr[j]
        arr.unshift(arr.delete_at(z))
        next
      else
        j += 1
      end

      next if arr[z] >= arr[z - 1]

      tmp = nil

      while j < z
        if arr[z] > arr[j]
          j += 1
        else
          tmp = arr[z]
          arr[z] = arr[z - 1]
          arr[z - 1] = tmp

          z -= 1
        end
      end
    end

    arr
  end
end
