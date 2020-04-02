class BubbleSort
  def self.call(arr)
    raise(ArgumentError, 'Argument must be an Array.') unless arr.is_a?(Array)

    loop do
      swap_occurred = false

      arr.each_with_index do |element, i|
        break unless arr[i + 1]

        next if element <= arr[i + 1]

        swap_occurred = true

        arr[i] = arr[i + 1]
        arr[i + 1] = element
      end

      break unless swap_occurred
    end

    arr
  end
end
