class BubbleSort
  def self.call(arr)
    raise ArgumentError.new('Argument must be an Array.') unless arr.kind_of?(Array)

    loop do
      swap_occurred = false

      arr.each_with_index do |element, index|
        break unless arr[index + 1]

        next if element < arr[index + 1]

        swap_occurred = true

        arr[index] = arr[index + 1]
        arr[index + 1] = element
      end

      break unless swap_occurred
    end

    arr
  end
end
