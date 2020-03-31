class LinkedList
  def initialize(value)
    node = Node.new(value)
    @head = node
    @tail = node
    @length = 1
  end

  attr_reader :head, :tail, :length

  def append(value)
    node = Node.new(value)
    @tail.next = node
    @tail = node
    @length += 1
    node
  end

  def prepend(value)
    node = Node.new(value)
    node.next = @head
    @head = node
    @length += 1
    node
  end

  def insert(value, index)
    return prepend(value) if index.zero?

    previous_node = find_previous_node(index)

    return append(value) if previous_node&.next.nil?

    node = Node.new(value)
    node.next = previous_node.next
    previous_node.next = node
    @length += 1
    node
  end

  def remove(index)
    return 'You cannot delete the last node.' if @length == 1

    if index.zero?
      node = @head
      @head = @head.next
      @length -= 1
      return node
    end

    previous_node = find_previous_node(index)

    return 'Node does not exist.' if previous_node&.next.nil?

    @tail = previous_node if previous_node.next == @tail

    node = previous_node.next
    previous_node.next = previous_node.next.next
    @length -= 1
    node
  end

  def print
    node = @head
    index = 0

    while node
      puts "#{index}: #{node.value}"
      index += 1
      node = node.next
    end
  end

  private

  def find_previous_node(index)
    node = @head

    (index - 1).times do
      node = node&.next

      break unless node
    end

    node
  end
end

class Node
  def initialize(value)
    @value = value
    @next = nil
  end

  attr_accessor :value, :next
end
