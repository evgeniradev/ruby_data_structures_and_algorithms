class MaxHeap < Array
  def initialize(array = [])
    @heapsize = array.length

    super(build_max_heap(array))
  end

  attr_reader :heapsize

  def insert!(value)
    self << value
    @heapsize += 1

    parent = find_parent(heapsize - 1)

    while parent >= 0
      max_heapify(self, parent)
      parent = find_parent(parent)
    end

    puts 'Node inserted.'

    value
  end

  def remove!(value)
    i = index(value)

    return puts('Node does not exist') unless i

    if reject { |v| v == value }.length < heapsize - 1
      error_message =
        "Operation not allowed as heap contains more than one node with value '#{value}'."

      return puts(error_message)
    end

    last_element = pop

    @heapsize -= 1

    unless value == last_element
      self[i] = last_element

      max_heapify(self, i)
    end

    puts 'Node removed.'

    value
  end

  def sort
    array = dup.to_a
    heapsize_cache = heapsize
    i = heapsize - 1

    while i >= 1
      tmp = array[0]
      array[0] = array[i]

      array[i] = tmp
      @heapsize -= 1

      max_heapify(array, 0)

      i = heapsize - 1
    end

    @heapsize = heapsize_cache

    array
  end

  def inspect
    "#<MaxHeap:#{super}>"
  end

  permitted_array_methods = %i[inspect [] sort map each each_with_index to_a]

  protected *[].public_methods(false).reject { |m| permitted_array_methods.include?(m) }

  private

  def find_parent(i)
    (i - 1) / 2
  end

  def max_heapify(array, i)
    left = (2 * i) + 1
    right = (2 * i) + 2

    largest = (left < heapsize && array[left] > array[i]) ? left : i

    largest = (right < heapsize && array[right] > array[largest]) ? right : largest

    return if largest == i

    tmp = array[i]
    array[i] = array[largest]
    array[largest] = tmp

    max_heapify(array, largest)
  end

  def build_max_heap(array)
    i = (heapsize / 2) - 1

    while i >= 0
      max_heapify(array, i)
      i -= 1
    end

    array
  end
end
