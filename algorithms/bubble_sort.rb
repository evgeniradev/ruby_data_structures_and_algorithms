class BubbleSort
  def self.call(array)
    raise(ArgumentError, 'Argument must be an Array.') unless array.is_a?(Array)

    loop do
      swap_occurred = false

      array.each_with_index do |element, i|
        break unless array[i + 1]

        next if element <= array[i + 1]

        swap_occurred = true

        array[i] = array[i + 1]
        array[i + 1] = element
      end

      break unless swap_occurred
    end

    array
  end
end
